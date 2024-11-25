#🐞 BugBank Automation Challenge

Este repositório contém o projeto de automação de testes para o **BugBank**, uma plataforma de testes criada para simular operações bancárias. Os testes foram desenvolvidos utilizando o **Robot Framework**, garantindo uma estrutura profissional e flexível, ideal para integração futura com pipelines de **CI/CD**.

## Funcionalidades Automadas

- Testes de login e autenticação.
- Validação da página de extrato
- Validação da página de transferência (em andamento)
- 
## Estrutura do Projeto

- **Tests**: Cenários de teste escritos de forma clara e modular.
- **Keywords**: Arquivos de palavras-chave reutilizáveis.
- **Variables**: Armazenamento de variáveis globais

## Como Executar

1. Clone o repositório:  
   ```bash
   git clone https://github.com/seu-usuario/bugbank-automation.git
   ```
2. Instale as dependências necessárias (Robot Framework e bibliotecas associadas).  
3. Execute os testes:  
   ```bash
   robot -d reports tests/
   ```

⚠️ É PRECISO ALTERAR O CAMINHO: ${CHROME_PROFILE_PATH}    C:/Users/scapi/Documents/GitHub/Automation_Challenge/chrome_profile

⚠️ Conforme descrito, peguei um cenário onde, por utilizar a funcionalidade de chrome_profile, aparentemente pode acontecer de duas funcionalidades agirem da mesma forma (on the homepage/on the extract page)
