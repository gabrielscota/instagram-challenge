# Instagram Challenge

Flutter project to recreate Instagram app with another UI/UX.

## Configurar Firebase Console

### Social Authentication

Gerar chave SHA1 com o comando `cd android && ./gradlew signingReport` e pegar a chave SHA1 de `debug`. Após copiar a chave, ir no console do firebase na parte de configurações do projeto, nessa tela terá os `Seus aplicativos` com as configurações do SDK, em `Impressões digitais do certificado SHA` e adicionar a chave gerada no console.

Ativar o método de login `Google` na parte de `Sign-in method` do authentication e baixar o novo arquivo do `google-services.json`.
