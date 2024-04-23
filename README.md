# grab
> There are some shell script for training on gpu


## script1


```shell
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

```
## script2

```shell
#!/bin/bash
echo $1, $2

export CUDA_VISIBLE_DEVICES=$1
# 设置Python文件路径
python_file1="your_python_file1.py"
python_file2="your_python_file2.py"
python_file3="your_python_file3.py"
# 设置间隔时间（单位：秒）
# interval=600  # 例如，间隔10分钟（600秒）
interval=$2
while true; 
do
    # 执行Python文件，并将输出保存到变量output中
    output=$(python $python_file1 2>&1)

    # 检查输出是否包含GPU显存不足的错误信息
    if echo "$output" | grep -q "out of memory"; then
        echo "GPU out of memory, waiting for $interval seconds before retrying..."
        sleep $interval
    else
        # 输出没有包含GPU显存不足的错误信息，退出循环
        echo "Python file1 executed successfully!"
        break
    fi
done
while true; 
do
    # 执行Python文件，并将输出保存到变量output中
    output=$(python $python_file2 2>&1)

    # 检查输出是否包含GPU显存不足的错误信息
    if echo "$output" | grep -q "out of memory"; then
        echo "GPU out of memory, waiting for $interval seconds before retrying..."
        sleep $interval
    else
        # 输出没有包含GPU显存不足的错误信息，退出循环
        echo "Python file2 executed successfully!"
        break
    fi
done
while true; 
do
    # 执行Python文件，并将输出保存到变量output中
    output=$(python $python_file3 2>&1)

    # 检查输出是否包含GPU显存不足的错误信息
    if echo "$output" | grep -q "out of memory"; then
        echo "GPU out of memory, waiting for $interval seconds before retrying..."
        sleep $interval
    else
        # 输出没有包含GPU显存不足的错误信息，退出循环
        echo "Python file3 executed successfully!"
        break
    fi
done

```


## script3

```shell
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


```




## script4


```shell
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

```



## demo1


```shell

GPU=0
interval=1200
TRAINING_TIMESTAMP=$(date +'%Y%m%d_%H%M%S')
TRAINING_LOG=GPU_${GPU}_SGA_${TRAINING_TIMESTAMP}
echo "$TRAINING_LOG"
mkdir ./log/$TRAINING_LOG

bash _train_trans_and_query_fixed_budget.sh $GPU $interval 2>&1 | tee ./log/$TRAINING_LOG/log.txt
```



## demo2

```shell

interval=1200
TRAINING_TIMESTAMP=$(date +'%Y%m%d_%H%M%S')
TRAINING_LOG=GPU_${GPU}_SGA_${TRAINING_TIMESTAMP}
echo "$TRAINING_LOG"
mkdir ./log/$TRAINING_LOG

bash _train_trans_and_query_fixed_budget.sh  $interval 2>&1 | tee ./log/$TRAINING_LOG/log.txt
```







