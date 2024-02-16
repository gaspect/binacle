# Documentaci�n


## Diagrama entidad relaci�n

````mermaid
erDiagram
     DOMINIO ||--o{ CLASE: tiene
     DIAGNOSTICO }o--o{ CLASE: tiene
     NIC ||--o{ DIAGNOSTICO: tiene
     NOC ||--o{ NIC: tiene
     NIC ||--o{ ACTIVIDAD: tiene      
     NOC ||--o{ INDICADOR: tiene 
     ESCALA ||--o{ INDICADOR: tiene
     ESCALA ||--o{ TIPO_ESCALA: tiene
      
         
     DOMINIO{
         serial id
         varchar dominio
         varchar nombre
         varchar version
         boolean deleted
     }
     
     CLASE{
         serial id
         serial dominio_fk
         varchar clase
         varchar nombre
         varchar version
         boolean deleted
     }
     
     DIAGNOSTICO{
         serial id
         serial clase_fk
         serial nic_fk
         varchar codigo
         varchar nombre
         varchar version
         boolean deleted
     }
     
     NIC{
         serial id
         serial noc_fk
         varchar codigo
         varchar nombre
         varchar version
         boolean deleted
     }
     NOC{
         serial id
         varchar nombre
         varchar version
         boolean deleted
     }
     ACTIVIDAD{
         serial id
         serial nic_fk
         varchar codigo
         varchar nombre
         varchar version
         boolean deleted
     }
     ESCALA{
         serial id
         varchar codigo
         varchar nombre
         varchar version
         boolean deleted
     }
     TIPO_ESCALA{
         serial id
         serial escala_fk
         varchar nombre
         varchar version
         boolean deleted
     }
     INDICADOR{
         serial id
         serial noc_fk
         serial escala_fk
         varchar codigo
         varchar nombre
         varchar version
         boolean deleted
     }
````

## Orden de migraci�n

- [x] DOMINIO
- [x] CLASE
- [x] ESCALA
- [x] TIPO_ESCALA
- [x] NOC
- [ ] INDICADOR
- [ ] NIC
- [ ] ACTIVIDAD
- [ ] DIAGNOSTICO

