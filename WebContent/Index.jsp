<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Titulo</title>
</head>
<body>
<h1>Formulario</h1>

<form action="graph.jsp" method = "post">
<table><tr>
  <!-- Lista de opciones -->
<select  name = "selectVar">
<!--Variable: <select name = "selectVar"> -->
<option value ="BarCMgMed [US$/MWh]"> Costo Marginal Medio [US$/MWh] </option>
<option value ="BarCMgSig [US$/MWh]"> Costo Marginal Sig [US$/MWh] </option>
<option value ="BarCMgAsi [PU]"> Costo Marginal Asi [PU] </option>
<option value ="BarCMgMax [US$/MWh]"> Costo Marginal Máximo [US$/MWh] </option>
<option value ="BarCMgMin [US$/MWh]"> Costo Marginal Mínimo [US$/MWh] </option>
<option value ="BarDemEne [GWh]"> Demanda Energética [GWh] </option>
 </select>
<!-- </select><br>  -->
</tr><tr>
Barra:</tr><tr> <input type="text" list="items" name = "selectBar">
<datalist id="items">
<option value ="Algarrobo 110"> Algarrobo 110 </option>
<option value ="Cardones 110"> Cardones 110 </option>
<option value ="Cardones 220"> Cardones 220 </option>
<option value ="Carrera Pinto 220"> Carrera Pinto 220 </option>
<option value ="Casas Viejas 110"> Casas Viejas 110 </option>
<option value ="Castilla 110"> Castilla 110 </option>
<option value ="Choapa 110"> Choapa 110 </option>
<option value ="Choapa 220"> Choapa 220 </option>
<option value ="Chuschampis 110"> Chuschampis 110 </option>
<option value ="Diego de Almagro 220"> Diego de Almagro 220 </option>
<option value ="Nueva Diego de Almagro 220"> Nueva Diego de Almagro 220 </option>
<option value ="Nueva Diego de Almagro 220 Aux"> Nueva Diego de Almagro 220 Aux </option>
<option value ="Dos Amigos 110"> Dos Amigos 110 </option>
<option value ="El Peñon 110"> El Peñon 110 </option>
<option value ="Espinos 220"> Espinos 220 </option>
<option value ="Illapel 110"> Illapel 110 </option>
<option value ="Incahuasi 110"> Incahuasi 110 </option>
<option value ="Las Compañias 110"> Las Compañias 110 </option>
<option value ="Las Palmas 220"> Las Palmas 220 </option>
<option value ="Las Palmas Aux 220"> Las Palmas Aux 220 </option>
<option value ="Los Vilos 220"> Los Vilos 220 </option>
<option value ="Los Vilos Aux 220"> Los Vilos Aux 220 </option>
<option value ="Maitencillo 110"> Maitencillo 110 </option>
<option value ="Maitencillo 220"> Maitencillo 220 </option>
<option value ="Maitencillo Aux 220"> Maitencillo Aux 220 </option>
<option value ="Marbella 110"> Marbella 110 </option>
<option value ="Minera del Carmen 220"> Minera del Carmen 220 </option>
<option value ="Monte Redondo 220"> Monte Redondo 220 </option>
<option value ="Ovalle 110"> Ovalle 110 </option>
<option value ="Pajonales 110"> Pajonales 110 </option>
<option value ="Pan de Azucar 110"> Pan de Azucar 110 </option>
<option value ="Pan de Azucar 220"> Pan de Azucar 220 </option>
<option value ="Pan de Azucar Aux 220"> Pan de Azucar Aux 220 </option>
<option value ="Paposo 220"> Paposo 220 </option>
<option value ="Punta Colorada 220"> Punta Colorada 220 </option>
<option value ="Punta Colorada Aux 220"> Punta Colorada Aux 220 </option>
<option value ="Punta Toro 110"> Punta Toro 110 </option>
<option value ="Quinquimo A 110"> Quinquimo A 110 </option>
<option value ="Romeral 110"> Romeral 110 </option>
<option value ="Tap Talinay 220"> Tap Talinay 220 </option>
<option value ="Diego de Almagro 220 Aux"> Diego de Almagro 220 Aux </option>
<option value ="Nueva Cardones Aux 220"> Nueva Cardones Aux 220 </option>
<option value ="Nueva Cardones 220"> Nueva Cardones 220 </option>
<option value ="Nueva Maitencillo Aux 220"> Nueva Maitencillo Aux 220 </option>
<option value ="Nueva Maitencillo 220"> Nueva Maitencillo 220 </option>
<option value ="Nueva Pan de Azucar Aux 220"> Nueva Pan de Azucar Aux 220 </option>
<option value ="Nueva Pan de Azucar 220"> Nueva Pan de Azucar 220 </option>
<option value ="Nueva Cardones 500"> Nueva Cardones 500 </option>
<option value ="">  </option>
<option value ="Charrua 220"> Charrua 220 </option>
<option value ="">  </option>




<option value ="">  </option>
</datalist>
</tr>
<tr>
Barra: <input type="text" list="items" name = "selectBar2">
<datalist id="items">
<option value ="Algarrobo 110"> Algarrobo 110 </option>
<option value ="Cardones 110"> Cardones 110 </option>
<option value ="Cardones 220"> Cardones 220 </option>
<option value ="Carrera Pinto 220"> Carrera Pinto 220 </option>
<option value ="Casas Viejas 110"> Casas Viejas 110 </option>
<option value ="Castilla 110"> Castilla 110 </option>
<option value ="Choapa 110"> Choapa 110 </option>
<option value ="Choapa 220"> Choapa 220 </option>
<option value ="Chuschampis 110"> Chuschampis 110 </option>
<option value ="Diego de Almagro 220"> Diego de Almagro 220 </option>
<option value ="Nueva Diego de Almagro 220"> Nueva Diego de Almagro 220 </option>
<option value ="Nueva Diego de Almagro 220 Aux"> Nueva Diego de Almagro 220 Aux </option>
<option value ="Dos Amigos 110"> Dos Amigos 110 </option>
<option value ="El Peñon 110"> El Peñon 110 </option>
<option value ="Espinos 220"> Espinos 220 </option>
<option value ="Illapel 110"> Illapel 110 </option>
<option value ="Incahuasi 110"> Incahuasi 110 </option>
<option value ="Las Compañias 110"> Las Compañias 110 </option>
<option value ="Las Palmas 220"> Las Palmas 220 </option>
<option value ="Las Palmas Aux 220"> Las Palmas Aux 220 </option>
<option value ="Los Vilos 220"> Los Vilos 220 </option>
<option value ="Los Vilos Aux 220"> Los Vilos Aux 220 </option>
<option value ="Maitencillo 110"> Maitencillo 110 </option>
<option value ="Maitencillo 220"> Maitencillo 220 </option>
<option value ="Maitencillo Aux 220"> Maitencillo Aux 220 </option>
<option value ="Marbella 110"> Marbella 110 </option>
<option value ="Minera del Carmen 220"> Minera del Carmen 220 </option>
<option value ="Monte Redondo 220"> Monte Redondo 220 </option>
<option value ="Ovalle 110"> Ovalle 110 </option>
<option value ="Pajonales 110"> Pajonales 110 </option>
<option value ="Pan de Azucar 110"> Pan de Azucar 110 </option>
<option value ="Pan de Azucar 220"> Pan de Azucar 220 </option>
<option value ="Pan de Azucar Aux 220"> Pan de Azucar Aux 220 </option>
<option value ="Paposo 220"> Paposo 220 </option>
<option value ="Punta Colorada 220"> Punta Colorada 220 </option>
<option value ="Punta Colorada Aux 220"> Punta Colorada Aux 220 </option>
<option value ="Punta Toro 110"> Punta Toro 110 </option>
<option value ="Quinquimo A 110"> Quinquimo A 110 </option>
<option value ="Romeral 110"> Romeral 110 </option>
<option value ="Tap Talinay 220"> Tap Talinay 220 </option>
<option value ="Diego de Almagro 220 Aux"> Diego de Almagro 220 Aux </option>
<option value ="Nueva Cardones Aux 220"> Nueva Cardones Aux 220 </option>
<option value ="Nueva Cardones 220"> Nueva Cardones 220 </option>
<option value ="Nueva Maitencillo Aux 220"> Nueva Maitencillo Aux 220 </option>
<option value ="Nueva Maitencillo 220"> Nueva Maitencillo 220 </option>
<option value ="Nueva Pan de Azucar Aux 220"> Nueva Pan de Azucar Aux 220 </option>
<option value ="Nueva Pan de Azucar 220"> Nueva Pan de Azucar 220 </option>
<option value ="Nueva Cardones 500"> Nueva Cardones 500 </option>
<option value ="">  </option>
<option value ="Charrua 220"> Charrua 220 </option>
<option value ="">  </option>




<option value ="">  </option>
</datalist>
</tr></tr>

<input type="submit" name="btn1" value="Enviar"></tr>
</table>
</form>

</body>
</html>