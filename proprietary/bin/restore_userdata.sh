#!/system/bin/sh
export PATH=/system/bin:$PATH
PART_ALIAS=$1
BLOCK_DEVICE=/dev/block/${PART_ALIAS}

/system/bin/check_userdata ext3 ${BLOCK_DEVICE} /data
ret=$?
if [ $ret -eq 1 ];then
	e2fsck -p ${BLOCK_DEVICE}
	ret=$?
	if [ $ret -gt 1 ];then
		echo "issues with e2fsck ret = $ret"
	fi
else
	mke2fs -m 0 -j -L ${PART_ALIAS} ${BLOCK_DEVICE}
	ret=$?
	if [ $ret -eq 0 ];then
		echo "${PART_ALIAS} partition formatted"
	else
		echo "${PART_ALIAS} partition format failed"
		exit
	fi
fi


