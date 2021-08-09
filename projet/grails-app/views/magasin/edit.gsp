

<%@ page import="projet.Magasin" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <g:set var="entityName" value="${message(code: 'default.magasin.label', default: 'Magasin')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
<div class="body">
    <div class="container">
        <div class="content">
            <div class="page-header">
                <h2 id="type"><g:message code="default.edit.label" args="[entityName]" /></h2>
            </div>
            <g:if test="${flash.message}">
                <div class="alert alert-info" role="alert">${flash.message}</div>
            </g:if>

            <div class="panel panel-primary">
                <div class="panel-body">

                    <g:hasErrors bean="${magasinInstance}">
                        <div class="alert alert-danger" role="alert">
                            <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="false"></span>
                            <span >Errors :</span>
                            <g:renderErrors bean="${magasinInstance}" as="list" />
                        </div>
                    </g:hasErrors>

                    <g:form method="post" class="form-horizontal">
                        <g:hiddenField name="id" value="${magasinInstance?.id}" />

                        <div class="form-group ${hasErrors(bean: magasinInstance, field: 'nom', 'has-error')}">
                            <label for="name" class="col-sm-3 control-label">
                                <g:message code="default.name.label" default="Name" />
                            </label>

                            <div class="col-sm-6">
                                <g:textField name="name" value="${magasinInstance?.nom}" class="form-control"/>
                            </div>
                        </div>
                        <hr/>

                        <div class="form-group">
                            <div class="col-sm-12">
                                <g:hiddenField name="_method" value="" />
                                <g:link class="btn btn-default" role="button" action="index">
                                    <span class="glyphicon glyphicon-list glyphicon-blue" aria-hidden="true"></span>
                                    ${message(code: 'default.button.list.label', default: 'List')}
                                </g:link>
                            </div>
                        </div>
                    </g:form>
                </div>
            </div>
        </div> <!-- content -->
    </div> <!-- container -->
</div> <!-- body -->
</body>
</html>
