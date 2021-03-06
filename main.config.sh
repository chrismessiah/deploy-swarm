# ************************ CLOUD PROVIDER CONFIG *******************************

CLOUD_PROVIDER="DIGITAL_OCEAN"
# CLOUD_PROVIDER="HETZNER_CLOUD"

# ****************************** SCRIPT CONFIG *********************************

NODES=1

# DOCKER_VERSION="18.06.2~ce~3-0~ubuntu"
DOCKER_VERSION="18.06.3~ce~3-0~ubuntu"

USE_NIP_DOMAIN="true"

GITLAB_REGISTRATION_TOKEN=`echo -e "import random,string\ni = string.digits + string.ascii_lowercase\no = ''.join(random.choice(i) for x in range(20))\nprint o" | python`
