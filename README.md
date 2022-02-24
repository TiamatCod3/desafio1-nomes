O app foi publicado no site: https://alunos-uff.herokuapp.com/

Foi criada a classe Student que recebeu a seed da planilha csv que está salva na lib/seeds.

O algoritmo pensado foi de própria concepção e ficou alocado de forma desacoplada no MailHelper com a classe Mail com o método de processar os emails possíveis a partir do nome. O gerador de email também verificava a presença de determinado email na lista uffmails de estudantes. Na classe de estudantes foi criada a constraint de unicidade para o uffmail e de verdadeiro para atualização destes campos.
