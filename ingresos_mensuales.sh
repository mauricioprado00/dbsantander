echo ""
echo "## Ingresos Mensuales ##"
echo ""
mysql -uroot -pelNuev0 banco -e "select concat(year(fecha),month(fecha)) as "mes", sum(monto) as "gasto" from entrada_banco where monto > 0 group by 1"
