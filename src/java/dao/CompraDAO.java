/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import modelo.Compra;

/**
 *
 * @author aluno
 */
public class CompraDAO extends GenericDAO<Compra, String>{
        public CompraDAO(){
            super(Compra.class);
        }
}
