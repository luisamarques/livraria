<%@include file="cabecalho.jsp"%>
<%
    if(request.getParameter("id")==null){
        response.sendRedirect("index.jsp");
        return;
    }
    Integer id = Integer.parseInt(request.getParameter("id"));
    LivroDAO dao = new LivroDAO();
    List<Livro> lista = dao.listar();
    Livro obj = dao.buscarPorChavePrimaria(id);
    AutorDAO adaoo = new AutorDAO();

%>
<aside id="colorlib-hero" class="breadcrumbs">
			<div class="flexslider">
				<ul class="slides">
			   	<li style="background-image: url(images/cover-img-1.jpg);">
			   		<div class="overlay"></div>
			   		<div class="container-fluid">
			   			<div class="row">
				   			<div class="col-md-6 col-md-offset-3 col-sm-12 col-xs-12 slider-text">
				   				<div class="slider-text-inner text-center">
				   					<h1>Detalhe do Produto </h1>
				   					<h2 class="bread"><span><a href="index.html">Home</a></span> <span><a href="shop.html">Product</a></span> <span>Product Detail</span></h2>
				   				</div>
				   			</div>
				   		</div>
			   		</div>
			   	</li>
			  	</ul>
		  	</div>
		</aside>

		<div class="colorlib-shop">
			<div class="container">
				<div class="row row-pb-lg">
					<div class="col-md-10 col-md-offset-1">
						<div class="product-detail-wrap">
							<div class="row">
                                                           
								<div class="col-md-5">
									<div class="product-entry">
										<div class="product-img" style="background-image: url(../arquivos/<%=obj.getImagem1()%>);">
											<p class="tag"><span class="sale">Sale</span></p>
										</div>
										<div class="thumb-nail">
											<a href="#" class="thumb-img" style="background-image: url(../arquivos/<%=obj.getImagem1()%>);"></a>
											<a href="#" class="thumb-img" style="background-image: url(../arquivos/<%=obj.getImagem2()%>);"></a>
											<a href="#" class="thumb-img" style="background-image: url(../arquivos/<%=obj.getImagem3()%>);"></a>
										</div>
									</div>
								</div>
								<div class="col-md-7">
									<div class="desc">
										<h3><%=obj.getNome()%></h3>
										<p class="price">
											<span>R$<%=obj.getPreco()%></span> 
											<span class="rate text-right">
												<i class="icon-star-full"></i>
												<i class="icon-star-full"></i>
												<i class="icon-star-full"></i>
												<i class="icon-star-full"></i>
												<i class="icon-star-half"></i>
												(74 Rating)
											</span>
										</p>
										<p><%=obj.getSinopse()%></p>
                                                                                <span>
                                                                                    Categoria:  <%=obj.getCategoria()%> <br/>   
                                                                                    Editora: <%=obj.getEditora()%>
                                                                                </span>
										<div class="row row-pb-sm">
											<div class="col-md-4">
                                    <div class="input-group">
                                    	<span class="input-group-btn">
                                       	<button type="button" class="quantity-left-minus btn"  data-type="minus" data-field="">
                                          <i class="icon-minus2"></i>
                                       	</button>
                                   		</span>
                                    	<span class="input-group-btn">
                                       	<button type="button" class="quantity-right-plus btn" data-type="plus" data-field="">
                                            <i class="icon-plus2"></i>
                                        </button>
                                    	</span>
                                 	</div>
                        			</div>
										</div>
										<p><a href="cart.html" class="btn btn-primary btn-addtocart"><i class="icon-shopping-cart"></i> Add to Cart</a></p>
									</div>
								</div>
							
                                                        </div>
						</div>
					</div>
				</div>

<%@include file="rodape.jsp"%>