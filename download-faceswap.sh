#!/bin/bash

echo "🎭 下载 Face Swap 模型文件..."

BASE_URL="https://github.com/Rsers/rsers-releases/releases/download/v1.0.0-faceswap"

files=(
    "buffalo_l.zip"
    "GFPGANv1.4.pth" 
    "inswapper_128.onnx"
    "detection_Resnet50_Final.pth"
    "parsing_parsenet.pth"
)

echo "📍 下载位置：$(pwd)"
echo "🌐 下载源：$BASE_URL"
echo ""

for file in "${files[@]}"; do
    echo "📥 下载 $file..."
    if command -v wget > /dev/null; then
        wget -c "$BASE_URL/$file"
    elif command -v curl > /dev/null; then
        curl -L -C - -O "$BASE_URL/$file"
    else
        echo "❌ 错误：需要安装 wget 或 curl"
        exit 1
    fi
    
    if [ $? -eq 0 ]; then
        echo "✅ $file 下载完成"
    else
        echo "❌ $file 下载失败"
    fi
    echo ""
done

echo "🎉 所有文件下载完成！"
echo "📁 文件位置：$(pwd)" 