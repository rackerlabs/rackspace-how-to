---
permalink: como-modifico-meus-arquivos-de-hosts/
audit_date: '2018-09-06'
title: Como modifico meus arquivos de hosts?
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2018-09-07'
last_modified_by: Kate Dougherty
product: Cloud DNS
product_url: cloud-dns
---

Modificar o seu arquivo de hosts permite substituir o sistema de nome de
domínio (DNS) para um domínio num máquina especifica. Este processo e útil
quando quiseres executar uma das seguintes tarefas:

- Avaliar o seu site sem o link de teste antes de ir ao vivo com o SSL.
- Verificar se o alias de um local funciona antes de alterações de DNS.
- Ou por outros motivos relacionados com o DNS.

Modificar o arquivo de hosts involve adicionar duas entradas no arquivo.

Cada entrada contem um endereço de IP para o qual site quer resolver e o
endereço de domínio. Adicionar as duas linhas a seguir, por exemplo,
**www.dominio.com** e **dominio.com** aponta direto ao nosso PHP5-ITK cluster
(“Refreshed” PHP5):

    64.49.219.194 www.domain.com
    64.49.219.194 domain.com

Este artigo providencias instruções para localizar e editar o arquivo de hosts
para os seguintes sistemas:

- Microsoft&reg; Windows&reg; 10, Windows 8, Windows 7, and Windows
  Vista&trade;
- Microsoft Windows NT&trade;, Windows 2000, and Windows XP
- Linux&reg;
- MacOS&reg; X versions 10.0 through 10.1.5
- MacOS X versions 10.6 through 10.12

Depois de adicionar a informação do domínio e guardar o aquivo, o seu sistema
começa a resolver para o IP especificado. Quando a avaliação tiver terminado,
remova as entradas.

### Windows

Windows 10, Windows 8, Windows 7, e Windows Vista usam o Controle de Conta de
Usuário (UAC, sua sigla em Inglês), de modo que o Bloco de Notas (Microsoft
Notepad) deve ser executado como administrador.

#### Para Windows 10 e Windows 8

NEED INTRO HERE

1. Pressione a tecla **Windows**.
2. Escreva **Bloco e Notas** (Notepad) no campo de pesquisa.
3. No campo de pesquisa, pressione o botão direito do mouse sobre Bloco de
   notas (Notepad) e selecione **Executar como administrador** (Run as
   administrator).
4. No Bloco de Notas (Notepad), abra o arquivo a seguir:

    **C:\Windows\System32\drivers\etc\hosts**
5. Faça as alterações necessárias no arquivo hosts.
6. Pressione **Arquivo > Salvar** (File > Save) para salvar as alterações.

#### Para Windows 7 e Windows Vista

NEED INTRO HERE

1. Clique **Iniciar > Todos os Programas > Acessórios**
   (Start > All Programs > Accessories).
2. Clique com o botão direito do mouse Bloco de Notas (Notepad) e selecione
   **Executar como administrador** (Run as administrator).
3. Clique em **Continuar** na janela do UAC “Windows precisa da sua permissão”
   (Windows needs your permission).
4. Quando o Bloco de Notas (Notepad) abrir, clique em **Arquivo > Abrir**
   (File > Open).
5. No campo **Nome do arquivo** (File name), digite:

    **C:\Windows\System32\drivers\etc\hosts**
6. Clique **Abrir** (Open).
7. Faça as alterações necessárias no arquivo hosts.
8. Clique **Arquivo > Salvar** (File > Save) para salvar as alterações.

#### Para Windows NT, Windows 2000, e Windows XP

NEED INTRO HERE

1. Clique **Iniciar > Todos os Programas > Acessórios > Bloco de Notas**
   (Start > All Programs > Accessories > Notepad).
2. Clique **Arquivo > Abrir** (File > Open).
3. No campo Nome do arquivo, digite **C:\Windows\System32\drivers\etc\hosts**.
4. Clique **Abrir** (Open).
5. Faça as alterações necessárias no arquivo hosts.
6. Clique **Arquivo > Salvar** (File > Save) para salvar as alterações.

### Linux

NEED INTRO HERE

1. Abra uma janela de Terminal.
2. Abra o arquivo hosts em um editor de texto (você pode usar qualquer editor
   de texto):

       sudo nano /etc/hosts
3. Digite sua senha.
4. Faça as alterações necessárias no arquivo hosts.
5. Pressione **Ctrl+X** (Clique **Ctrl** e pressione **X**) e, em seguida,
   clique quando perguntado se você deseja salvar as alterações.

### Mac OS X 10.0 - 10.10

NEED INTRO HERE

#### Mac OS X 10.0 - 10.1.5

NEED INTRO HERE

1. Abra **Applications/Utilities/NetInfo Manager**.
2. Para permitir a edição do banco de dados do NetInfo, clique no cadeado no
   canto inferior esquerdo da janela.
3. Digite sua senha e pressione **OK**.
4. Na segunda coluna da janela do navegador, selecione o nó (node) chamado
   **machines**.
5. Você verá -DHCP-, BroadcastHost, e localhost na terceira coluna. Selecione
   o elemento de localhost na terceira coluna.
6. Escolha **Duplicar** no menu **Editar** (o caminho mais rápido para criar
   uma nova entrada é duplicar uma existente).

    Um alerta de confirmação aparece.
7. Pressione **Duplicar**.

    Uma nova entrada chamada localhost copia e suas propriedades são mostradas
    abaixo da janela do browser.
8. Pressione duas vezes o valor da propriedade ip_address e digite o endereço
   IP do outro computador.
9. Prima duas vezes o valor da propriedade de nome e digite o nome do host que
    você deseja para o outro computador.
10. Pressione a propriedade e escolha **Excluir** (Delete) no menu **Editar**
    (Edit).
11. Clique em **Salvar** (Save) no menu **Arquivo** (File).

     Alerta de confirmação aparece.
12. Clique em **Atualizar essa cópia** (Update this copy).
13. Repita os passos de 6 a 12 para cada entrada de host adicional que você
    deseja adicionar.
14. Selecione **Sair** do menu de **NetInfo Manager**.

     Não há necessidade de reiniciar o computador.

#### Mac OS X 10.6 - 10.10

NEED INTRO HERE

1. Pressione **Abra Aplicativos > Utilitários > Terminal**
   (Applications > Utilities > Terminal).
2. Abra o arquivo **hosts**, digitando o seguinte na janela Terminal:

       sudo nano /privado/etc/hosts

3. Digite sua senha quando solicitado.
4. Edite o arquivo **hosts**.

    O arquivo hosts contém comentários (linhas que começam com #), e alguns
    nomes de host de mapeamento padrão (por exemplo, 127.0.0.1 host local).
    Fixe seus novos mapeamentos abaixo os mapeamentos padrão.

5. Salve o arquivo hosts pressionando **Ctrl+X** y e resposta.
6. Para que as alterações tenham efeito, esvaziar o cache DNS com o seguinte
   comando:

       dscacheutil -flushcache
