<?php
/**
 * CDN缓存刷新类
 * 支持多种CDN服务
 */
class cdn_refresh {
    private $accessKeyId;
    private $accessKeySecret;
    private $endpoint;
    private $cdnType; // cdn类型

    public function __construct($accessKeyId, $accessKeySecret, $endpoint = 'https://cdn.aliyuncs.com', $cdnType = 'aliyun_cdn') {
        $this->accessKeyId = $accessKeyId;
        $this->accessKeySecret = $accessKeySecret;
        $this->endpoint = $endpoint;
        $this->cdnType = $cdnType;
    }

    /**
     * 刷新CDN缓存
     * @param array $urls 要刷新的URL列表
     * @param string $type 刷新类型，file或dir
     * @return array 刷新结果
     */
    public function refresh($urls, $type = 'file') {
        if (empty($urls)) {
            return array('success' => false, 'message' => 'URL列表不能为空');
        }

        switch ($this->cdnType) {
            // 阿里云系列
            case 'aliyun_cdn':
            case 'aliyun_dcdn':
                return $this->refreshAliyunCDN($urls, $type);

            // 腾讯云系列
            case 'tencent_cdn':
            case 'tencent_dcdn':
                return $this->refreshTencentCDN($urls, $type);

            // 百度云系列
            case 'baidu_cdn':
            case 'baidu_dcdn':
                return $this->refreshBaiduCDN($urls, $type);

            // 华为云系列
            case 'huawei_cdn':
            case 'huawei_dcdn':
                return $this->refreshHuaweiCDN($urls, $type);

            default:
                return array('success' => false, 'message' => '不支持的CDN类型');
        }
    }

    /**
     * 刷新阿里云CDN/DCDN缓存
     * @param array $urls 要刷新的URL列表
     * @param string $type 刷新类型，file或dir
     * @return array 刷新结果
     */
    private function refreshAliyunCDN($urls, $type = 'file') {
        // 根据CDN类型设置不同的参数
        if ($this->cdnType == 'aliyun_dcdn') {
            // DCDN参数
            $params = array(
                'Action' => 'RefreshDcdnObjectCaches',
                'Format' => 'JSON',
                'Version' => '2018-01-15',
                'AccessKeyId' => $this->accessKeyId,
                'SignatureMethod' => 'HMAC-SHA1',
                'SignatureNonce' => uniqid(),
                'SignatureVersion' => '1.0',
                'Timestamp' => gmdate('Y-m-d\TH:i:s\Z'),
                'ObjectPath' => implode('\n', $urls),
                'ObjectType' => $type
            );
        } else {
            // CDN参数
            $params = array(
                'Action' => 'RefreshObjectCaches',
                'Format' => 'JSON',
                'Version' => '2018-05-10',
                'AccessKeyId' => $this->accessKeyId,
                'SignatureMethod' => 'HMAC-SHA1',
                'SignatureNonce' => uniqid(),
                'SignatureVersion' => '1.0',
                'Timestamp' => gmdate('Y-m-d\TH:i:s\Z'),
                'ObjectPath' => implode('\n', $urls),
                'ObjectType' => $type
            );
        }

        // 计算签名
        $params['Signature'] = $this->generateAliyunSignature($params);

        // 发送请求
        $response = $this->sendRequest($params);

        // 检查响应是否为空
        if (empty($response)) {
            return array('success' => false, 'message' => '响应为空', 'response' => $response);
        }

        $result = json_decode($response, true);

        // 检查JSON解析是否成功
        if (json_last_error() !== JSON_ERROR_NONE) {
            return array('success' => false, 'message' => '响应解析失败: ' . json_last_error_msg(), 'response' => $response);
        }

        if (isset($result['RefreshTaskId'])) {
            return array('success' => true, 'taskId' => $result['RefreshTaskId'], 'response' => $response);
        } else {
            return array('success' => false, 'message' => isset($result['Message']) ? $result['Message'] : '刷新失败', 'response' => $response);
        }
    }

    /**
     * 刷新腾讯云CDN/DCDN缓存
     * @param array $urls 要刷新的URL列表
     * @param string $type 刷新类型，file或dir
     * @return array 刷新结果
     */
    private function refreshTencentCDN($urls, $type = 'file') {
        $timestamp = time();
        $nonce = uniqid();

        // 构建请求参数
        $params = array(
            'Action' => 'PurgePathCache',
            'Version' => '2018-06-06',
            'Timestamp' => $timestamp,
            'Nonce' => $nonce,
            'SecretId' => $this->accessKeyId,
            'FlushType' => $type == 'dir' ? 'dir' : 'file'
        );

        // 腾讯云API需要为每个URL设置单独的参数
        foreach ($urls as $index => $url) {
            $params['Paths.' . $index] = $url;
        }

        // 计算签名
        $params['Signature'] = $this->generateTencentSignature($params);

        // 发送请求
        $response = $this->sendRequest($params);

        $result = json_decode($response, true);
        if (isset($result['Response']['RequestId'])) {
            return array('success' => true, 'taskId' => $result['Response']['RequestId']);
        } else {
            return array('success' => false, 'message' => isset($result['Response']['Error']['Message']) ? $result['Response']['Error']['Message'] : '刷新失败');
        }
    }

    /**
     * 刷新百度云CDN/DCDN缓存
     * @param array $urls 要刷新的URL列表
     * @param string $type 刷新类型，file或dir
     * @return array 刷新结果
     */
    private function refreshBaiduCDN($urls, $type = 'file') {
        $timestamp = time();
        $signStr = $this->accessKeyId . $timestamp;
        $signature = md5($signStr . $this->accessKeySecret);

        // 构建请求参数
        $params = array(
            'method' => 'POST',
            'accesskey' => $this->accessKeyId,
            'timestamp' => $timestamp,
            'sign' => $signature,
            'type' => $type == 'dir' ? 'directory' : 'file',
            'urlList' => implode('\n', $urls)
        );

        // 发送请求
        $response = $this->sendPostRequest('/rest/2.0/cdn/refresh', $params);

        $result = json_decode($response, true);
        if (isset($result['code']) && $result['code'] == 0) {
            return array('success' => true, 'taskId' => $result['data']['task_id']);
        } else {
            return array('success' => false, 'message' => isset($result['message']) ? $result['message'] : '刷新失败');
        }
    }

    /**
     * 刷新华为云CDN/DCDN缓存
     * @param array $urls 要刷新的URL列表
     * @param string $type 刷新类型，file或dir
     * @return array 刷新结果
     */
    private function refreshHuaweiCDN($urls, $type = 'file') {
        $timestamp = gmdate('Y-m-d\TH:i:s\Z');
        $nonce = uniqid();

        // 构建请求体
        $body = array(
            'type' => $type == 'dir' ? 'directory' : 'file',
            'urls' => $urls
        );

        // 构建请求头
        $headers = array(
            'Content-Type: application/json',
            'X-Auth-Token: ' . $this->accessKeySecret, // 华为云使用Token认证
            'X-Project-Id: ' . $this->accessKeyId, // 项目ID
            'X-Timestamp: ' . $timestamp,
            'X-Nonce: ' . $nonce
        );

        // 发送请求
        $response = $this->sendPostRequest('/v1.0/cdn/refresh-tasks', json_encode($body), $headers);

        $result = json_decode($response, true);
        if (isset($result['task_id'])) {
            return array('success' => true, 'taskId' => $result['task_id']);
        } else {
            return array('success' => false, 'message' => isset($result['error']['message']) ? $result['error']['message'] : '刷新失败');
        }
    }

    /**
     * 生成阿里云签名
     * @param array $params 请求参数
     * @return string 签名
     */
    private function generateAliyunSignature($params) {
        ksort($params);
        $canonicalizedQueryString = '';
        foreach ($params as $key => $value) {
            $canonicalizedQueryString .= '&' . $this->percentEncode($key) . '=' . $this->percentEncode($value);
        }
        $canonicalizedQueryString = ltrim($canonicalizedQueryString, '&');

        $stringToSign = 'GET&%2F&' . $this->percentEncode($canonicalizedQueryString);
        $signature = base64_encode(hash_hmac('sha1', $stringToSign, $this->accessKeySecret . '&', true));

        return $signature;
    }

    /**
     * 生成腾讯云签名
     * @param array $params 请求参数
     * @return string 签名
     */
    private function generateTencentSignature($params) {
        ksort($params);
        $stringToSign = 'GET' . $this->endpoint . '/?' . http_build_query($params);
        $signature = base64_encode(hash_hmac('sha1', $stringToSign, $this->accessKeySecret, true));
        return $signature;
    }

    /**
     * URL编码
     * @param string $str 要编码的字符串
     * @return string 编码后的字符串
     */
    private function percentEncode($str) {
        $res = urlencode($str);
        $res = preg_replace('/\+/', '%20', $res);
        $res = preg_replace('/\*/', '%2A', $res);
        $res = preg_replace('/%7E/', '~', $res);
        return $res;
    }

    /**
     * 发送GET请求
     * @param array $params 请求参数
     * @return string 请求响应
     */
    private function sendRequest($params) {
        $url = $this->endpoint . '?' . http_build_query($params);

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($ch, CURLOPT_TIMEOUT, 30); // 设置超时时间
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10); // 设置连接超时时间
        curl_setopt($ch, CURLOPT_HEADER, true); // 包含响应头

        $response = curl_exec($ch);
        $error = curl_error($ch);
        $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $header_size = curl_getinfo($ch, CURLINFO_HEADER_SIZE);
        $header = substr($response, 0, $header_size);
        $body = substr($response, $header_size);
        curl_close($ch);

        if ($error) {
            return json_encode(array('Message' => '请求失败：' . $error));
        }

        if ($http_code != 200) {
            return json_encode(array('Message' => 'HTTP错误：' . $http_code));
        }

        return $body;
    }

    /**
     * 发送POST请求
     * @param string $path 请求路径
     * @param mixed $data 请求数据
     * @param array $headers 请求头
     * @return string 请求响应
     */
    private function sendPostRequest($path, $data, $headers = array()) {
        $url = $this->endpoint . $path;

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_TIMEOUT, 30); // 设置超时时间

        if (!empty($headers)) {
            curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        }

        $response = curl_exec($ch);
        $error = curl_error($ch);
        $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);

        if ($error) {
            return json_encode(array('message' => '请求失败：' . $error));
        }

        if ($http_code != 200) {
            return json_encode(array('message' => 'HTTP错误：' . $http_code));
        }

        return $response;
    }
}
?>