#!/bin/bash
echo $1

export CUDA_VISIBLE_DEVICES=$1
# 设置Python文件路径
sh_file1="your_sh1.sh"
sh_file2="your_sh2.sh"
sh_file3="your_sh3.sh"
# 设置间隔时间（单位：秒）
# interval=600  # 例如，间隔10分钟（600秒）
interval=$1
while true; 
do
    for gpu in 0,1,2,3,4,5,6,7;
    do
        # 执行Python文件，并将输出保存到变量output中
        output=$(bash $sh_file1 $gpu 2>&1)

        # 检查输出是否包含GPU显存不足的错误信息
        if echo "$output" | grep -q "out of memory"; then
            echo "GPU out of memory on current CUDA, waiting for $interval seconds before retrying..."
        else
            # 输出没有包含GPU显存不足的错误信息，退出循环
            echo "Shell1 executed successfully!"
            break
        fi
    done
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
    for gpu in 0,1,2,3,4,5,6,7;
    do
        # 执行Python文件，并将输出保存到变量output中
        output=$(bash $sh_file2 $gpu 2>&1)

        # 检查输出是否包含GPU显存不足的错误信息
        if echo "$output" | grep -q "out of memory"; then
            echo "GPU out of memory on current CUDA, waiting for $interval seconds before retrying..."
        else
            # 输出没有包含GPU显存不足的错误信息，退出循环
            echo "Shell2 executed successfully!"
            break
        fi
    done
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
    for gpu in 0,1,2,3,4,5,6,7;
    do
        # 执行Python文件，并将输出保存到变量output中
        output=$(bash $sh_file3 $gpu 2>&1)

        # 检查输出是否包含GPU显存不足的错误信息
        if echo "$output" | grep -q "out of memory"; then
            echo "GPU out of memory on current CUDA, waiting for $interval seconds before retrying..."
        else
            # 输出没有包含GPU显存不足的错误信息，退出循环
            echo "Shell3 executed successfully!"
            break
        fi
    done
    if echo "$output" | grep -q "out of memory"; then
        echo "GPU out of memory, waiting for $interval seconds before retrying..."
        sleep $interval
    else
        # 输出没有包含GPU显存不足的错误信息，退出循环
        echo "Shell3 executed successfully!"
        break
    fi
done
