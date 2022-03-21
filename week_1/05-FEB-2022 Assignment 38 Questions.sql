--1. Display all the information of the EMP table
    SELECT 
     empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
    FROM
      EMP;
    
--2. Display unique Jobs from EMP table
    SELECT DISTINCT(job) 
    FROM EMP;
    
--3. List the emps in the asc order of their Salaries
    SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
    FROM 
        EMP
    ORDER BY
        sal;
        
--4. List the details of the emps in asc order of the Dptnos and desc of Jobs
    SELECT 
    empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
    FROM 
        EMP
    ORDER BY
        deptno,job desc;
    
--5. Display all the unique job groups in the descending order
    SELECT 
        DISTINCT(job) 
    FROM 
        EMP
    ORDER BY 
        job DESC;
        
    
--6.Display all the details of all 'Mgrs'
    SELECT 
       empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
    FROM 
        EMP
    WHERE
        mgr IS NOT NULL;
        
        
        
--7. List the emps who joined before 1981
    SELECT 
        * 
    FROM 
        EMP
    WHERE
        hiredate<'01-JAN-81';
        
--D 8. List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annsal
    SELECT 
       empno,ename,sal,(sal)/30 daily_sal
    FROM
       emp
    ORDER BY 
       sal*12;
    

--9	 Display the Empno, Ename, job, Hiredate, Exp of all Mgrs
    SELECT 
        empno,ename,job,Hiredate,ROUND((trunc(sysdate) - TRUNC(Hiredate))/365,0) AS exp_year
    FROM 
        EMP
    WHERE
        mgr IS NOT NULL;
        
    
--10	 List the Empno, Ename, Sal, Exp of all emps working for Mgr 7369
    SELECT 
        empno,ename,job,sal,ROUND((trunc(sysdate) - TRUNC(Hiredate))/365,0) AS exp_year
    FROM 
        EMP
    WHERE
        mgr IS NOT NULL AND mgr=7369;
        
        
--11	 Display all the details of the emps whose Comm  Is more than their Sal
    SELECT 
         empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
    FROM 
        EMP
    WHERE
        comm>sal;
        
--13	 List the emps along with their Exp and Daily Sal is more than Rs 100
        
SELECT 
        empno,ename,ROUND((trunc(sysdate) - TRUNC(Hiredate))/365,0) AS exp_year,(sal)/30 AS daily_sal
    FROM 
        EMP
    WHERE
       (sal)/30 >100;
        

--14	 List the emps who are either 'CLERK' or 'ANALYST' in the Desc order
    SELECT 
               empno,ename,job,hiredate
    FROM 
            EMP
    WHERE
            job='CLERK' or job='ANALYST'
    ORDER BY
            empno DESC;
            
        
--15	 List the emps who joined on 1-MAY-81,3-DEC-81,17-DEC-81,19-JAN-80 in asc order of seniority
    SELECT 
             empno,ename,job,hiredate
    FROM 
            EMP
    WHERE
            hiredate IN('1-MAY-81','3-DEC-81','17-DEC-81','19-JAN-80')
    ORDER BY
            hiredate;
            
--16	 List the emp who are working for the Deptno 10 or20
    SELECT 
              empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno 
    FROM 
            EMP
    WHERE
            deptno IN(10,20)
            
--17	 List the emps who are joined in the year 81
    SELECT 
            empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno 
    FROM 
            EMP
    WHERE
            hiredate LIKE '%81' ;
            
            
--19	 List the emps Who Annual sal ranging from 22000 and 45000

    SELECT 
              empno,ename,(sal*12) AS Annual
    From
            EMP
    WHERE
           (sal*12) BETWEEN 22000 AND 45000;
        
        
--20	 List the Enames those are having five characters in their Names
    --20.1 Excet 5
    SELECT 
             ename 
    FROM 
            EMP
    WHERE
           ename LIKE '_____';
    --20.2 ATLEAST 5
    SELECT 
             ename 
    FROM 
            EMP
    WHERE
           ename LIKE '_____%';
    
--21	 List the Enames those are starting with 'S' and with five characters
    --21.1 Excet 5
    SELECT 
             ename 
    FROM 
            EMP
    WHERE
           ename LIKE 'S____';
           
   --21.1 ATLEAST 5
    SELECT 
             ename 
    FROM 
            EMP
    WHERE
           ename LIKE 'S____%';
           
    
--22	 List the emps those are having four chars and third character must be 'r'
    --20.1 Excet 5
    SELECT 
             ename 
    FROM 
            EMP
    WHERE
           LOWER(ename) LIKE '__r_';
           
           
--23	 List the Five character names starting with 'S' and ending with 'H'
    SELECT 
             ename 
    FROM 
            EMP
    WHERE
           ename LIKE 'S___H';
        
        
--24	 List the emps who joined in January
        
    SELECT 
             empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
    FROM 
            EMP
    WHERE
           hiredate LIKE '___JAN%';
           
           
--27	 List the emps whose names having a character set 'll' together
    
    SELECT 
             *
    FROM 
            EMP
    WHERE
           lower(ename) LIKE '%ll%';
           
--29	 List the emps who does not belong to Deptno 20

    SELECT 
             *
    FROM 
            EMP
    WHERE
           deptno NOT IN(20);
           
           
--30	 List all the emps except 'PRESIDENT' & 'MGR' in asc order of Salaries

   SELECT 
      empno,ename,mgr,job,hiredate,sal,comm,deptno,branchno
   FROM
     emp
    WHERE 
        job!='PRESIDENT' AND empno NOT IN 
                                    (SELECT DISTINCT 
                                        mgr 
                                     FROM 
                                        emp 
                                     WHERE 
                                        mgr IS NOT NULL)
    ORDER BY
         sal ASC;
    
    
--31	 List the emps whose Empno not starting with digit78

    SELECT 
             empno,ename,job,mgr,hiredate,sal,comm,deptno,branchno
    FROM 
            EMP
    WHERE
           empno NOT LIKE '78%'
    
            
            
--33	 List the emps who are working under 'MGR'

    SELECT 
             *
    FROM 
            EMP
    WHERE
           nvl(mgr,0)>0;
           
           
--34	 List the emps who joined in any year but not belongs to the month of March

    SELECT 
             *
    FROM 
            EMP
    WHERE
           hiredate NOT LIKE '___MAR%';
           
           
--35	 List all the Clerks of Deptno 20

    SELECT 
             *
    FROM 
            EMP
    WHERE
           job IN ('CLERK') AND deptno=20;
           
           
--36	 List the emps of Deptno 30 or 10 joined in the year 1981
    
    SELECT 
             *
    FROM 
            EMP
    WHERE
           deptno IN(30,10) AND hiredate LIKE '%81' ;
           
           
--37	 Display the details of SMITH
    
    SELECT 
             *
    FROM 
            EMP
    WHERE
           ename IN('SMITH') ;
           
    SELECT 
            *
    FROM 
            branch  
    INNER JOIN 
        emp  
    ON 
        emp.ename='SMITH' AND emp.branchno=branch.branchno;
           

--38	 Display the location of SMITH

    SELECT 
            emp.ename,branch.location 
    FROM 
            branch  
    INNER JOIN 
        emp  
    ON 
        emp.ename='SMITH' AND emp.branchno=branch.branchno;  

           



    

    
    