<?php

/** 
 * Model DbTable Especie
 * 
 * @package Pesca
 * @subpackage Models/DbTable
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */

class Application_Model_DbTable_Especie extends Zend_Db_Table_Abstract
{

    protected $_name = 'T_EspecieCapturada';
    protected $_primary = 'TEC_ID';
    
}

