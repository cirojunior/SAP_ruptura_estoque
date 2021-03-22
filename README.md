# SAP_ruptura_estoque
Data Definition para coletar os dados do SAP e criar modelo no SAP Analytics Cloud.
Coletamos os dados das Ordens de venda ainda não faturadas "com ou sem remessa" e subtraímos das quantidades disponíveis em estoque.
Sempre que um produto tem mais quantidade em ordem de venda que em estoque o material entra em ruptura.
Assim é possível identificar os materiais que estão em ruptura, que vão ficar em ruptura ou que estão com estoque elevado.
Com script em R é possível fazer a análise de ruptura por dia, sendo possível identificar exatamente quando o material irá entrar em ruptura.
