<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="pt">

<head>
    <title>Qual máquina de cartão comprar? As melhores maquininhas</title>
    
    <spring:url value="/resources/pagseguro_files/compare.css" var="compareCSS" />
    <spring:url value="/resources/pagseguro_files/compare.js" var="compareJS" />
    <spring:url value="/resources/pagseguro_files" var="img" />
    
    
    <link rel="stylesheet" href="${compareCSS}">
</head>

<div class="readers-comparator readers-comparator--icons-green">
    <div class="readers-comparator__controls">
        <div class="readers-comparator__heading">
            <h1>Compare as maquininhas PagSeguro</h1>
            <p><strong>Selecione duas opções</strong></p>
        </div>

        <!-- SELECIONE AS OPÇÕES -->
        <div class="readers-comparator__options-container">
            <c:forEach items="${moderninhas}" var="moderninha">
	            <div class="readers-comparator__option">
	                <input type="checkbox" id="readers-comparator-option-${moderninha.model}">
	                <label for="readers-comparator-option-${moderninha.model}">
	                    <i class="psit-check"></i>
	                    <figure>
	                    	<c:choose>
			                    <c:when test="${moderninha.model == 'smart' || moderninha.model == 'pro' || moderninha.model == 'plus'}">
			                    		<img src="${img}/moderninha_${moderninha.model}.png">
			                   	</c:when>
			                   	<c:when test="${moderninha.model == 'chip'}">
			                    		<img src="${img}/minizinha_${moderninha.model}.png">
			                   	</c:when>
			                   	<c:when test="${moderninha.model == 'minizinha'}">
			                    		<img src="${img}/${moderninha.model}.png">
			                   	</c:when>
		                    </c:choose>
	                        <figcaption>${moderninha.name}</figcaption>
	                    </figure>
	                </label>
	            </div>
            </c:forEach>
        </div>

        <button id="readers-comparator-trigger" class="button button--ocean-green" disabled="">Compare os modelos</button>
    </div>


    <div class="readers-comparator__content lost-container">
        <div class="readers-comparator__items-container readers-comparator__items-container--separator readers-comparator__items-container--no-spacing-bottom">
        	<c:forEach items="${moderninhas}" var="moderninha">
	            <div data-id="readers-comparator-option-${moderninha.model}" class="product-offer" data-jets="readers-comparator-option-${moderninha.model}">
	                <figure>
	                    <c:choose>
		                    <c:when test="${moderninha.model == 'smart' || moderninha.model == 'pro' || moderninha.model == 'plus'}">
		                    		<img src="${img}/moderninha_${moderninha.model}.png">
		                   	</c:when>
		                   	<c:when test="${moderninha.model == 'chip'}">
		                    		<img src="${img}/minizinha_${moderninha.model}.png">
		                   	</c:when>
		                   	<c:when test="${moderninha.model == 'minizinha'}">
		                    		<img src="${img}/${moderninha.model}.png">
		                   	</c:when>
	                    </c:choose>
	                </figure>
	            </div>
	        </c:forEach>
        </div>
    </div>

    <!-- PREÇO -->
    <div class="readers-comparator__content readers-comparator__content--sticky">
        <div class="readers-comparator__items-container readers-comparator__items-container--separator readers-comparator__items-container--no-spacing-top lost-container">
           <c:forEach items="${moderninhas}" var="moderninha">
	            <div data-id="readers-comparator-option-${moderninha.model}" class="product-offer product-offer--installments-color-dark" data-jets="readers-comparator-option-${moderninha.model}">
	                <p class="product-offer__name">
	                    <a href="https://pagseguro.uol.com.br/venda-presencial/checkout-direto/sales-store/index-home.html">${moderninha.name}</a>
	                </p>
	                <p class="product-offer__installments">${moderninha.installmentQuantity} × <strong>R$ ${moderninha.installmentValue}</strong></p>
	                <p class="product-offer__full-price"><small>à vista R$ ${moderninha.totalValue}</small></p>
	                <p class="product-offer__buy-button">
	                    <a href="https://pagseguro.uol.com.br/venda-presencial/checkout-direto/sales-store/index-home.htmlt" class="button button--x-small button--ocean-green">Comprar</a>
	                </p>   
	            </div>
        </c:forEach>
        </div>
    </div>

    <!-- CARTÃO DE CREDITO -->
    <div class="readers-comparator__container">
        <div class="readers-comparator__content lost-container">
            <h2>Cartões de crédito</h2>
			
            <div class="readers-comparator__items-container readers-comparator__items-container--separator">
                <c:forEach items="${moderninhas}" var="moderninha">
	                <div data-id="readers-comparator-option-${moderninha.model}" class="readers-comparator__brands-group" data-jets="readers-comparator-option-${moderninha.model}">
	                    <div class="readers-comparator__brands-info">
	                        <div class="readers-comparator__brands-list">
	                            <span>
	                                <figure>
	                                    <img src="${img}/bandeiras.png" alt="bandeiras">
	                                </figure>
	                            </span>
	                        </div>
	
	                        <div class="readers-comparator__brands-taxes">
	                            <div class="readers-comparator__brands-taxes-item">
	                                <span>${moderninha.credidCardModel.inCash}%</span> <small>à vista</small>
	                            </div>
	                            <div class="readers-comparator__brands-taxes-item">
	                                <span>${moderninha.credidCardModel.inInstallment}%</span> <small>parcelado*</small>
	                            </div>
	                        </div>
	                    </div>
	                </div>
                </c:forEach>
            </div>

            <h3>Prazo de recebimento</h3>

            <div class="readers-comparator__items-container">
	            <c:forEach items="${moderninhas}" var="moderninha">
	                <p data-id="readers-comparator-option-${moderninha.model}" class="readers-comparator__item-content" data-jets="readers-comparator-option-${moderninha.model}"><span class="readers-comparator__icon-wrapper">${moderninha.credidCardModel.receiptPeriod}</span> dias</p>
	            </c:forEach>
            </div>

            <p><small>*Vendas parceladas, acréscimo de 2,99% ao mês.</small></p>

            <!-- COMPATIBILIDADE -->
            <h2>Compatibilidade e recursos</h2>

            <h3>Aparelhos</h3>

            <div class="readers-comparator__items-container">
	            <c:forEach items="${moderninhas}" var="moderninha">
	                <div data-id="readers-comparator-option-${moderninha.model}" class="readers-comparator__item-content" data-jets="readers-comparator-option-${moderninha.model}">
	                    <img src="${img}/${moderninha.resourceCompatibilityModel.device}.png" />
	                </div>
	            </c:forEach>
            </div>

            <h3>Comprovante</h3>

            <div class="readers-comparator__items-container">
                <c:forEach items="${moderninhas}" var="moderninha">
	                <div data-id="readers-comparator-option-${moderninha.model}" class="readers-comparator__item-content" data-jets="readers-comparator-option-${moderninha.model}">
	                    <img src="${img}/${moderninha.resourceCompatibilityModel.receipt}.png" />
	                </div>
	            </c:forEach>
            </div>

            <h3>Conexão</h3>

            <div class="readers-comparator__items-container">
                <c:forEach items="${moderninhas}" var="moderninha">
	                <div data-id="readers-comparator-option-${moderninha.model}" class="readers-comparator__item-content" data-jets="readers-comparator-option-${moderninha.model}">
	                    <img src="${img}/${moderninha.resourceCompatibilityModel.connection}.png" />
	                </div>
	            </c:forEach>
            </div>

            <!-- DETALHES TECNICOS -->
            <h2>Detalhes técnicos</h2>

            <div class="readers-comparator__items-container">
	            <c:forEach items="${moderninhas}" var="moderninha">
	                <dl data-id="readers-comparator-option-${moderninha.model}" class="readers-comparator__item-specs" data-jets="readers-comparator-option-${moderninha.model}">
	                    <dt>Bateria</dt>
	                    <dd>${moderninha.technicalDetailModel.battery}</dd>
	                    <dt>Conectividade</dt>
	                    <dd>${moderninha.technicalDetailModel.connectivity}</dd>
	                    <dt>Dimensão (C x L x A)</dt>
	                    <dd>${moderninha.technicalDetailModel.dimension}</dd>
	                    <dt>Garantia</dt>
	                    <dd>${moderninha.technicalDetailModel.warranty}</dd>
	                    <dt>Peso</dt>
	                    <dd>${moderninha.technicalDetailModel.weight}</dd>
	                    <dt>Teclado</dt>
	                    <dd>${moderninha.technicalDetailModel.keyboard}</dd>
	                    <dt>Visor</dt>
	                    <dd>${moderninha.technicalDetailModel.display}</dd>
	                    <dt>Voltagem</dt>
	                    <dd>${moderninha.technicalDetailModel.voltage}</dd>
	                </dl>
	            </c:forEach>
            </div>
        </div>
    </div>
</div>

<script src="${compareJS}"></script>

</html>