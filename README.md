# Update Magento 2 instance project script

- **Author**  : [Antoine Subit](http://www.subit.fr/antoine) - antoine@subit.fr 
- **Licence** : [GNU GPL v3](https://choosealicense.com/licenses/gpl-3.0/)

## What for ?
This small shell script allows you to update a Magento 2 instance in a complete and reliable manner to the Magento way of command line.

## Installation
There is two ways to get this script :

**Clone repository**
```
git clone https://github.com/asubit/magento2-script-project-update.git
```

**Download source**
```
wget https://github.com/asubit/magento2-script-project-update/archive/master.zip
unzip master.zip
```
 
Then put `update.sh` file inside Magento project's root directory (*e.g. : /var/www/project-name*).

```
cp master/update.sh /var/www/project-name/update.sh
```

## Configuration

- Search for `project-name` and replace it with your project directory name (/var/www/project-name)
- Search for `ProjectName` and replace it with your frontend project directory name (in pub/static/frontend/ProjectName)
- Search for `language:list` and put after this line all installed langages. You can know it running `php bin/magento info:language:list`
- Search for `Manage Git` for configure your own specific Git process

## Usage

```
sh update.sh
```

or you can add it to your path and then use it running : 

```
update
```
