#Update all Salario row dinamicamente
Update salario s 
join (Select s.*, st.salarioTotal from salario s
join salarioTotal st 
on st.idEmpregado = s.idEmpregado And Year(s.dtSalario) = st.Ano And Month(s.dtSalario) = st.mes) st 
on st.idSalario = s.idSalario And Year(s.dtSalario) = Year(st.dtSalario) And Month(s.dtSalario) = Month(st.dtSalario)
set s.Total = st.SalarioTotal;

Update horario h
join salario s on s.idEmpregado = h.idEmpregado And Year(s.dtSalario) = Year(h.dtHorario) And Month(s.dtSalario) = Month(h.dtHorario)
set h.idSalario = s.idSalario;