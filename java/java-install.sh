# Install oracle java
# give 1st parameter is name of directory contain oracle java

user=`whoami`
if [ "${user}" != "root" ]; then
	echo "ERROR: Must run with root permission!"
	exit 1
fi

dest_dir=/usr/lib/jvm
source_folder=${1%/}


if [ ! -d "${dest_dir}" ]; then
	mkdir -p "${dest_dir}"
fi	

folder_name=$(echo ${source_folder} | awk -F '/' '{print $NF}')
cp -r ${source_folder} ${dest_dir}/${folder_name}
#echo $1
update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/$1/bin/java" 1
update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/$1/bin/javac" 1
update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/lib/jvm/$1/bin/javawis" 1
update-alternatives --config java
update-alternatives --config javac
update-alternatives --config javaws
