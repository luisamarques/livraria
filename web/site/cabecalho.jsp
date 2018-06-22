<%@page import="dao.LivroDAO"%>
<%@page import="modelo.Livro"%>
<%@page import="dao.AutorDAO"%>
<%@page import="modelo.Autor"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Categoria"%>
<!DOCTYPE HTML>
<%
    CategoriaDAO cdao = new CategoriaDAO();
    List<Categoria> clista = cdao.listar();
    cdao.fecharConexao();
    AutorDAO adao = new AutorDAO();
     List<Autor> alista = adao.listar();
     adao.fecharConexao();
     LivroDAO ldao = new LivroDAO();
     List<Livro> llista;
     if(request.getParameter("categoriaid")!=null){
         Integer id = Integer.parseInt(request.getParameter("categoriaid"));
         Categoria c = cdao.buscarPorChavePrimaria(id);
         llista = c.getLivroList();
         
     }
     else{
         llista = ldao.listar();
     }
     ldao.fecharConexao();
%>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Store Template</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<meta name="author" content="" />


	<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700" rel="stylesheet">
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="css/bootstrap.css">

	<!-- Magnific Popup -->
	<link rel="stylesheet" href="css/magnific-popup.css">

	<!-- Flexslider  -->
	<link rel="stylesheet" href="css/flexslider.css">

	<!-- Owl Carousel -->
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">
	
	<!-- Date Picker -->
	<link rel="stylesheet" href="css/bootstrap-datepicker.css">
	<!-- Flaticons  -->
	<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="css/style.css">

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body>
		
	<div class="colorlib-loader"></div>

	<div id="page">
		<nav class="colorlib-nav" role="navigation">
			<div class="top-menu">
				<div class="container">
					<div class="row">
						<div class="col-xs-2">
							<div id="colorlib-logo"><a href="index.html">Livraria da Luísa</a></div>
						</div>
						<div class="col-xs-10 text-right menu-1">
							<ul>
								<li class="active"><a href="index.jsp">Início</a></li>
								<li class="has-dropdown">
									<a href="index.jsp">Categorias</a>
									<ul class="dropdown">
										<%
                                                                                    for(Categoria item : clista){
                                                                                        
                                                                                    
                                                                                %>
                                                                                <li><a href="index.jsp?categoriaid=<%=item.getId()%>"><%=item.getNome()%></a></li>
									<%}%>
                                                                        </ul>
								</li>
							
                                                                <li class="has-dropdown">
	
									<a href="index.jsp">Autores</a>
									<ul class="dropdown">
                                                                            <%
                                                                                    for(Autor item : alista){
                                                                                        
                                                                                    
                                                                                %>
                                                                                <li><a href="index.jsp?autorid=<%=item.getId()%>"><%=item.getNome()%></a></li>
									<%}%>
										
									</ul>
								</li>
								<li><a href="about.html">About</a></li>
								<li><a href="contact.html">Contact</a></li>
								<li><a href="cart.html"><i class="icon-shopping-cart"></i> Cart [0]</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</nav>