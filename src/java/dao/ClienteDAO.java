/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import modelo.Cliente;

/**
 *
 * @author aluno
 */
public class ClienteDAO extends GenericDAO<Cliente, String>{
     public ClienteDAO(){
        super(Cliente.class);
    }
    
}
