#!/bin/bash
echo $1, $2


# 设置Python文件路径
sh_file1="your_sh1.sh"
sh_file2="your_sh2.sh"
sh_file3="your_sh3.sh"
# 设置间隔时间（单位：秒）
# interval=600  # 例如，间隔10分钟（600秒）
interval=$2
while true; 
do
    # 执行Python文件，并将输出保存到变量output中
    output=$(bash $sh_file1 $1 2>&1)

    # 检查输出是否包含GPU显存不足的错误信息
    if echo "$output" | grep -q "out of memory"; then
        echo "GPU out of memory, waiting for $interval seconds before retrying..."
        sleep $interval
    else
        # 输出没有包含GPU显存不足的错误信息，退出循环
        echo "Shell1 executed successfully!"
        break
    fi
done
while true; 
do
    # 执行Python文件，并将输出保存到变量output中
    output=$(bash $sh_file2 $1 2>&1)

    # 检查输出是否包含GPU显存不足的错误信息
    if echo "$output" | grep -q "out of memory"; then
        echo "GPU out of memory, waiting for $interval seconds before retrying..."
        sleep $interval
    else
        # 输出没有包含GPU显存不足的错误信息，退出循环
        echo "Shell2 executed successfully!"
        break
    fi
done
while true; 
do
    # 执行Python文件，并将输出保存到变量output中
    output=$(bash $sh_file3 $1 2>&1)

    # 检查输出是否包含GPU显存不足的错误信息
    if echo "$output" | grep -q "out of memory"; then
        echo "GPU out of memory, waiting for $interval seconds before retrying..."
        sleep $interval
    else
        # 输出没有包含GPU显存不足的错误信息，退出循环
        echo "Shell3 executed successfully!"
        break
    fi
done
