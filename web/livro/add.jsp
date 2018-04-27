<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="dao.AutorDAO"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="modelo.Autor"%>
<%@page import="util.StormData"%>
<%@page import="modelo.Categoria"%>
<%@page import="dao.LivroDAO"%>
<%@page import="modelo.Livro"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="dao.EditoraDAO"%>
<%@page import="modelo.Editora"%>
<%@page import="java.util.List"%>

<%@include file="../cabecalho.jsp" %>
<%
    String msg = "";
    String classe = "";
 
    Livro obj = new Livro();
    LivroDAO dao = new LivroDAO();
    Categoria cat = new Categoria();
    Editora edi = new Editora();

    CategoriaDAO cdao = new CategoriaDAO();
    List<Categoria> clista = cdao.listar();
     EditoraDAO edao = new EditoraDAO();
    List<Editora> elista = edao.listar();
     AutorDAO adao = new AutorDAO();
    List<Autor> alista = adao.listar();
    if (request.getParameter("txtNome") != null && request.getParameter("txtPreco")!= null && request.getParameter("txtData") != null && request.getParameter("txtCategoria") !=null && request.getParameter("txtEditora") != null) {
        obj.setNome(request.getParameter("txtNome"));
        cat.setId(Integer.parseInt(request.getParameter("txtCategoria")));
        edi.setCnpj(request.getParameter("txtEditora"));
        
        obj.setCategoria(cat);
        obj.setImagem1(request.getParameter("txtImagem1"));
        obj.setImagem2(request.getParameter("txtImagem2"));
        obj.setImagem3(request.getParameter("txtImagem3"));
        obj.setSinopse(request.getParameter("txtSinopse"));
        obj.setPreco(Float.parseFloat(request.getParameter("txtPreco")));
        obj.setEditora(edi);
        obj.setDatapublicacao(StormData.formata(request.getParameter("txtData")));
   
        
         String[] autoresid =  request.getParameter("autores").split(";");
        
        List<Autor> listaautores = new ArrayList<>();
        for(String id : autoresid){
            Integer idinteger =  Integer.parseInt(id);
             listaautores.add(new Autor());
            
            
            
            
        }
        obj.setAutorList(listaautores);
        

        Boolean resultado = dao.incluir(obj);
        dao.fecharConexao();
        if (resultado) {
            msg = "Registro cadastrado com sucesso";
            classe = "alert-success";
        } else {
            msg = "Não foi possível cadastrar";
            classe = "alert-danger";
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
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">
            Livros
        </div>
        <div class="panel-body">

            <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="../UploadWS" method="post" enctype="multipart/form-data"m>

                <div class="col-lg-6">

                    <div class="form-group">
                        <label>Nome</label>
                        <input class="form-control" type="text"  name="txtNome"  required />
                        <label>Sinopse</label>
                        <input class="form-control" type="text"  name="txtSinopse"  required />
                        <label> Foto 1 </label>
                        <input type="file" name="txtImagem1">
                        <label> Foto 2 </label>
                        <input type="file" name="txtImagem2">
                        <label> Foto 3 </label>
                        <input type="file" name="txtImagem3">
                        <label>Data de Publicação</label>
                        <input class="form-control" type="text"  name="txtData"  required />
                        <label>Preço</label>
                        <input class="form-control" type="text"  name="txtPreco"  required />
                        <label> Autores </label>
                        <select name="autores" multiple>
                           
                            <%
                                for (Autor a : alista) {
                            %>
                            <option value="<%=a.getId()%>">
                                <%=a.getNome()%>
                            </option>
                            <%}%>
                        </select>
                        <label> Editora </label>
                        <select name="txtEditora">
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
                        <select name="txtCategoria">
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
<!-- 1/.row -->
<%@include file="../rodape.jsp" %>