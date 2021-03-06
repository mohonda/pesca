<?php

/** 
 * Controller de Especies
 * 
 * @package Pesca
 * @subpackage Controllers
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */

class EspecieController extends Zend_Controller_Action
{
    private $modelEspecie;

    public function init()
    {
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('index');
        }
        
        $this->_helper->layout->setLayout('admin');
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        $this->modelEspecie = new Application_Model_Especie();
    }

    /*
     * Lista todas as artes de pesca
     */
    public function indexAction()
    {        
        $dados = $this->modelEspecie->select();
      
        $this->view->assign("dados", $dados);
    }
    
    /*
     * Exibe formulário para cadastro de um usuário
     */
    public function novoAction()
    {
        
    }
    
    /*
     * Cadastra uma Arte de Pesca
     */
    public function criarAction()
    {
        $this->modelEspecie->insert($this->_getAllParams());

        $this->_redirect('especie/index');
    }
    
    /*
     * Preenche um formulario com as informações de um usuário
     */
    public function editarAction()
    {
        $especie = $this->modelEspecie->find($this->_getParam('id'));
        
        $this->view->assign("especie", $especie);
    }
   
    /*
     * Atualiza os dados do usuário
     */
    public function atualizarAction()
    {
        $this->modelEspecie->update($this->_getAllParams());

        $this->_redirect('especie/index');
    }
 
    /*
     * 
     */
    public function excluirAction()
    {
        $this->modelEspecie->delete($this->_getParam('id'));

        $this->_redirect('especie/index');
    }
    
}

