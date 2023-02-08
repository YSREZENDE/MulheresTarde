<?php
    session_start();
    ob_start();

    require_once 'conexao.php';

    $dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
    $codigoproduto = $dados["codigo"];

    if(!empty($dados["excluir"])){

        $sqlexcluir = "DELETE from carrinho where codigoproduto = $codigoproduto";
        $resulexcluir=$conn->prepare($sqlexcluir);
        $resulexcluir->execute();
        $_SESSION["quant"]-=1;
    }else{
        if(!isset($_SESSION['nome'])){
            $_SESSION["carrinho"] = true;
            echo "<script>
            alert('Faça Login para Finalizar sua Compra!!!');
            parent.location = 'login.php';
            </script>";
        }
        else{
            //acessar pagamento;
            $data = date('y-m-d');
            $valor = $_SESSION['totalcompra'];            
            $matricula = $_SESSION["matricula"];
          
            $sqlvenda = "INSERT into venda(data,valor,matricula)values(:data,:valor,:matricula)";
            $salvarvenda= $conn->prepare($sqlvenda);
            $salvarvenda->bindParam(':data', $data, PDO::PARAM_STR);
            $salvarvenda->bindParam(':valor', $valor, PDO::PARAM_STR);
            $salvarvenda->bindParam(':matricula', $matricula, PDO::PARAM_STR);        
            $salvarvenda->execute();


            $venda = "select LAST_INSERT_ID()";
            $resulvenda=$conn->prepare($venda);
            $resulvenda->execute();

            $linhavenda = $resulvenda->fetch(PDO::FETCH_ASSOC);

            $idvenda = ($linhavenda["LAST_INSERT_ID()"]);


            $busca = "select * from carrinho";
            $resulbusca=$conn
            $resulbusca->execute();

if(($resulbusca) && ($resulbusca->rowCount()!=0)){
    while ($linha = $resulbusca->fetch(PDO::FETCH_ASSOC)){
        extract($linha);
        var_dump($linha);

        $sqlitem = "inset into item(codigoproduto,idvenda,quantidade,velor)
        values(:codigoproduto,:idvenda,:quantidade,:valor)";
    $salvaritem= $conn->prepare($sqlitem);
    $salvaritem->bindParam(':codigoproduto', $codigoproduto, PDO::PARAM_INT);
    $salvaritem->bindParam(':idvenda', $idvenda, PDO::PARAM_INT);
    $salvaritem->bindParam(':quantidade', $quantidade, PDO::PARAM_INT);
    $salvaritem->bindParam(':valor', $valor, PDO::PARAM_INT);
    $salvaritem->execute();

    /**fazer atualização estoque**/
    $estoque = "UPDATE produto set quantidade=(quantidade- $quantcompra)
    where codigoproduto = $codigoproduto";
    $atualiza=$conn->prepare($estoque);
    $atualiza->execute();






    }
}

$sqllimpa = "delete from carrinho";
$limpa= $conn->prepare($sqllimpa);
$limpa->execute();
$limpa["quant"] = 0;

header ("Location:index.php");





        }
    }



    ?>