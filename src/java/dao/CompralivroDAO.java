/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import modelo.Compralivro;

/**
 *
 * @author aluno
 */
public class CompralivroDAO extends GenericDAO<Compralivro, String>{
    public CompralivroDAO(){
        super(Compralivro.class);
    }
}
