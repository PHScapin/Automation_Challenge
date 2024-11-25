*** Variables ***

# Application URL
${BASE_URL}             https://bugbank.netlify.app/
${CHROME_PROFILE_PATH}    C:/Users/scapi/Documents/GitHub/Automation_Challenge/chrome_profile

# ATENÇÃO: NÃO CONSEGUI COLOCAR O CAMINHO RELATIVO DA PASTA CHROME PROFILE. POR CONSEQUÊNCIA, PARA FUNCIONAR, TROQUE-O.

# User + Password (Valid)
${VALID_USER}           account@gmail.com
${VALID_PASSWORD}       account123#
${FAKE_EMAIL}           fake_email@gmail.com

# User 2 + Password (Valid)
${VALID_USER_2}          
${VALID_PASSWORD_2}

# Browser Configurations
${BASE_BROWSER}         chrome
${TIMEOUT}              5

# Random Word
${FAKE_WORD}            Generate Random String 10
