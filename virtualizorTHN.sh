#!/bin/bash
#yum install php -y
chattr -i /usr/local/virtualizor/license2.php
rm -rf /usr/local/virtualizor/license2.php 
#php_cwd=`/usr/bin/php << EOF
php_cwd=`HjmxCbt2wQQYYfWjBbAu5EKyzPM2rW0Yg5c//aGG5kqor1fhdNptNpZeD6EA898PYMZQdlqDoc6nQUXuE2dQzSgu11zquOKpowva6J6YhpZlc8eJ5eAYXdZzLFPHSdj+d9O6Rpd0u8qOOVdA7V6GdD9tW6S1eyYMQuXYtj4l+aCVztssdIwxBL512N3ru8ROExwAIYC2Lqnz30ul8o1O1qa0ej6cNTnmvq4Xr0DIDIu8zqQg6QWuUP5MTt2g0uAuSTZNZH9VZLwvMIxChSFzmgVdO1K1MCNJpRFSZRpxF/veP7uOR0JwM9WCHPU/ZIyOb5PfzXfbRXzQyr/hKrtZVSdmkg7QdYMAdTBiR2Ct0kZA9aCEacAZ8r1GbXLMbaiT3gJNfURu6IWxMUr4ISKzdWqfIOqjG1ixvLT2v24L3HEHguDdxwfwXEfccSf+4QNv4PsHvZc=`
echo $php_cwd > /usr/local/virtualizor/license2.php
chattr +i /usr/local/virtualizor/license2.php
