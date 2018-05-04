<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Autor"%>
<%@page import="dao.AutorDAO"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="modelo.Categoria"%>
<%@page import="util.StormData"%>
<%@page import="modelo.Livro"%>
<%@page import="dao.LivroDAO"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="modelo.Editora"%>
<%@page import="dao.EditoraDAO"%>
<%@include file="../cabecalho.jsp" %>
<%
String msg ="";
String classe = "";
    
    LivroDAO dao = new LivroDAO();
    Livro obj = new Livro();
    Categoria cat = new Categoria();
    Editora edi = new Editora();
    CategoriaDAO cdao = new CategoriaDAO();
    List<Categoria> clista = cdao.listar();
     EditoraDAO edao = new EditoraDAO();
    List<Editora> elista = edao.listar();
     AutorDAO adao = new AutorDAO();
    List<Autor> alista = adao.listar();
    //verifica se é postm ou seja, quer alterar
    if(request.getMethod().equals("POST")){
        
        //popular com oq ele digitou no form
        obj.setId(Integer.parseInt(request.getParameter("txtId")));
        obj.setNome(request.getParameter("txtNome"));
        obj.setPreco(Float.parseFloat(request.getParameter("txtPreco")));
        obj.setDatapublicacao(StormData.formata("dd/MM/yyyy"));
        obj.setSinopse(request.getParameter("txtSinopse"));
        cat.setNome(request.getParameter("txtCategoria"));
        edi.setNome(request.getParameter("txtEditora"));
        obj.setCategoria(cat);
        obj.setEditora(edi);
        obj.setImagem1(request.getParameter("txtImagem1"));
        obj.setImagem2(request.getParameter("txtImagem2"));
        obj.setImagem3(request.getParameter("txtImagem3"));
        
        String[] autoresid =  request.getParameter("autores").split(";");
         List<Autor> listaautores = new ArrayList<>();
        for(String id : autoresid){
            Integer idinteger =  Integer.parseInt(id);
             listaautores.add(new Autor(idinteger));
            
            
            
            
        }
        obj.setAutorList(listaautores);
   
        Boolean resultado = dao.alterar(obj);
        
        if(resultado){
            msg = "Registro alterado com sucesso";
            classe = "alert-success";
        }
        else{
            msg = "Não foi possível alterar";
            classe = "alert-danger";
        }
        
    }else{
        //e GET
        if(request.getParameter("codigo") == null){
            response.sendRedirect("index.jsp");
            return;
        }
        
        dao = new LivroDAO();
        obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
        
        if(obj == null){
            response.sendRedirect("index.jsp");
            return;
        } 
    }
%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Sistema de Comércio Eletrônico
            <small>Admin</small>
        </h1>
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="index.jsp">Área Administrativa</a>
            </li>
            <li class="active">
                <i class="fa fa-file"></i> Aqui vai o conteúdo de apresentação
            </li>
        </ol>
    </div>
</div>
<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">
            Livro
        </div>
        <div class="panel-body">

            <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="../UploadWS" method="post" enctype="multipart/form-data"m>
                
                <div class="col-lg-6">
                        <div class="form-group">
                            <label>Id</label>
                            <input class="form-control" type="text"  name="txtId"  readonly value="<%=obj.getId() %>" />
                        <label>Nome</label>
                        <input class="form-control" type="text"  name="txtNome"  required value ="<%=obj.getNome()%>"/>
                        <label>Sinopse</label>
                        <input class="form-control" type="text"  name="txtSinopse"  required value="<%=obj.getSinopse()%>"/>
                        <label> Foto 1 </label>
                        <input type="file" name="txtImagem1" value="<%=obj.getImagem1()%>">
                        <label> Foto 2 </label>
                        <input type="file" name="txtImagem2" value="<%=obj.getImagem2()%>">
                        <label> Foto 3 </label>
                        <input type="file" name="txtImagem3" value="<%=obj.getImagem3()%>">
                        <label>Data de Publicação</label>
                        <input class="form-control" type="text"  name="txtData"  required value="<%=obj.getDatapublicacao()%>"/>
                        <label>Preço</label>
                        <input class="form-control" type="text"  name="txtPreco"  required value="<%=obj.getPreco()%>"/>
                        <label> Autores </label>
                        <select name="autores" multiple value="<%=obj.getAutorList()%>">
                           
                            <%
                                for (Autor a : alista) {
                            %>
                            <option value="<%=a.getId()%>">
                                <%=a.getNome()%>
                            </option>
                            <%}%>
                        </select>
                        <label> Editora </label>
                        <select name="txtEditora" value="<%=obj.getEditora()%>">
                            <option value=""> Selecione </option>
                            <%
                                for (Editora e : elista) {
                            %>
                            <option value="<%=e.getCnpj()%>">
                                <%=e.getNome()%>
                            </option>
                            <%}%>
                        </select>
                            <label> Categoria </label>
                        <select name="txtCategoria" value="<%=obj.getCategoria()%>">
                            <option value=""> Selecione </option>
                            <%
                                for (Categoria c : clista) {
                            %>
                            <option value="<%=c.getId()%>">
                                <%=c.getNome()%>
                            </option>
                            <%}%>
                        </select>
                    </div>
                    
                    


                <button class="btn btn-primary btn-sm" type="submit">Salvar</button>
                
            </form>
        </div>
    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>