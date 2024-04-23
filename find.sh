#!/bin/bash
# 设置Python文件路径
python_file="your_python_file.py"

# 设置间隔时间（单位：秒）
# interval=600  # 例如，间隔10分钟（600秒）
interval=1200
while true; 
do
    # 执行Python文件，并将输出保存到变量output中
    output=$(python $python_file 2>&1)

    # 检查输出是否包含GPU显存不足的错误信息
    if echo "$output" | grep -q "out of memory"; then
        echo "GPU out of memory, waiting for $interval seconds before retrying..."
        sleep $interval
    else
        # 输出没有包含GPU显存不足的错误信息，退出循环
        echo "Python file executed successfully!"
        break
    fi
done
