<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Default Filesystem Disk
    |--------------------------------------------------------------------------
    |
    | Here you may specify the default filesystem disk that should be used
    | by the framework. A "local" driver, as well as a variety of cloud
    | based drivers are available for your choosing. Just store away!
    |
    */

    'default' => env('FILESYSTEM_DRIVER', 'oss'),

    /*
    |--------------------------------------------------------------------------
    | Filesystem Disks
    |--------------------------------------------------------------------------
    |
    | Here you may configure as many filesystem "disks" as you wish, and you
    | may even configure multiple disks of the same driver. Defaults have
    | been setup for each driver as an example of the required options.
    |
    | Supported Drivers: "local", "ftp", "sftp", "s3"
    |
    */

    'disks' => [

        'local' => [
            'driver' => 'local',
            'root' => storage_path('app'),
            'throw' => false,
        ],

        'uploads' => [
            'driver' => 'oss',
            'root' => storage_path('app/uploads'),
            'url' => '/storage/app/uploads',
            'visibility' => 'public',
            'throw' => false,
        ],

        'media' => [
            'driver' => 'oss',
            'root' => storage_path('app/media'),
            'url' => '/storage/app/media',
            'visibility' => 'public',
            'throw' => false,
        ],

        'resources' => [
            'driver' => 'local',
            'root' => storage_path('app/resources'),
            'url' => '/storage/app/resources',
            'visibility' => 'public',
            'throw' => false,
        ],

        's3' => [
            'driver' => 's3',
            'key' => env('AWS_ACCESS_KEY_ID'),
            'secret' => env('AWS_SECRET_ACCESS_KEY'),
            'region' => env('AWS_DEFAULT_REGION'),
            'bucket' => env('AWS_BUCKET'),
            'url' => env('AWS_URL'),
            'endpoint' => env('AWS_ENDPOINT'),
            'use_path_style_endpoint' => env('AWS_USE_PATH_STYLE_ENDPOINT', false),
            'throw' => false,
        ],

        'oss' => [
            "driver"            => "oss",
            "access_key_id"     => env('AWS_ACCESS_KEY_ID'),        // 必填, 阿里云的AccessKeyId
            "access_key_secret" => env('ALIYUN_SECRET_ACCESS_KEY'),      // 必填, 阿里云的AccessKeySecret
            "bucket"            => env('ALIYUN_BUCKET'),               // 必填, 对象存储的Bucket, 示例: my-bucket
            "endpoint"          => env('ALIYUN_ENDPOINT'),             // 必填, 对象存储的Endpoint, 示例: oss-cn-shanghai.aliyuncs.com
            "internal"          => env("OSS_INTERNAL", null),          // 选填, 内网上传地址,填写即启用 示例: oss-cn-shanghai-internal.aliyuncs.com
            "domain"            => null,            // 选填, 绑定域名,填写即启用 示例: oss.my-domain.com
            "prefix"            => "storage/app/uploads",              // 选填, 统一存储地址前缀
            "use_ssl"           => false,              // 选填, 是否使用HTTPS
            "reverse_proxy"     => env("OSS_REVERSE_PROXY", false),    // 选填, 域名是否使用NGINX代理绑定
            "throw"             => env("OSS_THROW", false),            // 选填, 是否抛出引起错误的异常,默认出现错误时,不抛出异常仅返回false
            "options"           => [],                                 // 选填, 添加全局配置参数, 示例: [\OSS\OssClient::OSS_CHECK_MD5 => false]
            "macros"            => [],
        ],
    ],

];