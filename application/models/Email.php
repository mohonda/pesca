<?php

class Application_Model_Email
{
    private $mensagem;
    private $assunto;
    private $destinatario;

    public function  __construct($mensagem, $assunto, $destinatarioEmail, $destinatarioNome) {
        $this->assunto = utf8_decode($assunto);
        $this->mensagem = $mensagem;
        $this->destinatario['email'] = utf8_decode($destinatarioEmail);
        $this->destinatario['nome'] = utf8_decode($destinatarioNome);
    }

    public function enviar(){
        $settings = array(
            'ssl'=>'ssl',
            'port'=>465,
            'auth' => 'login',
            'username' => 'noreply.pesca@gmail.com',
            'password' => 'Pesca@Pesca'
            );
        
        $transport = new Zend_Mail_Transport_Smtp('smtp.gmail.com', $settings);
        $email_from = "noreply.pesca@gmail.com";
        $name_from = "Pesca";
        $email_to = $this->destinatario['email'];
        $name_to = $this->destinatario['nome'];

        $mail = new Zend_Mail ();
        $mail->setReplyTo($email_from, $name_from);
        $mail->setFrom ($email_from, $name_from);
        $mail->addTo ($email_to, $name_to);
        $mail->setSubject ($this->assunto);
        $mail->setBodyText ($this->mensagem);
        $mail->send($transport);
        
        /*
        $smtp = "smtp.google.com";
        $mailTransport = new Zend_Mail_Transport_Smtp($smtp, $this->getConfiguracao());

        $mail = new Zend_Mail();
        $mail->setBodyHtml($this->mensagem, 'utf-8');
        $mail->setFrom('noreply.pesca@gmail.com', utf8_decode('Pesca') );
        $mail->addTo($this->destinatario['email'], $this->destinatario['nome']);
        $mail->setSubject($this->assunto);
        return $mail->send($mailTransport);
         
         */
    }

    private function getConfiguracao(){        
        $conta = "noreply.pesca@gmail.com,";
        $senha = "Pesca@Pesca";

        $config = array (
            'auth' => 'login',
            'username' => $conta,
            'password' => $senha,
            'ssl' => 'tls',
            'auth' => 'login',
            'port' => 25
        );

        return $config;
    }

}

