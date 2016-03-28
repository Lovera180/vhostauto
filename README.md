# vhostauto

Segue um script para criar uma estrutura de virtual host para o laravel 5.1.
É necessário ter o composer instalado, caso não tenha Clique aqui
Lembre-se de alterar o nome de usuário no trecho `chown -R www-data:user $1` de `user` para o nome do seu usuário…

Para usar, basta copiar o código e colar em um arquivo qualquer com extensão .sh e para executar, basta abrir o terminal (Ctrl+Alt+T) executar como super usuário e passar como parâmetro o domínio desejado. Veja abaixo.

`sudo sh criavhost.sh meudomino.com.br`
