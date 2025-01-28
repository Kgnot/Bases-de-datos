package udistrital.module.bd.entities;

import java.sql.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "Usuario")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Usuario {
    
    @Id
    @Column(name = "usuario",length = 5)
    private String usuario;
    @Column(name = "nombre",length = 30,nullable = false)
    private String nombre;
    @Column(name = "apellido",length = 30,nullable = false)
    private String apellido;
    @Column(name = "fechanacimiento")
    private Date fechaNacimiento;
    @Column(name = "fechacreacion")
    private Date fechaCreacion;
    @Column(name = "correoalterno",length = 30)
    private String correoAlterno;
    @Column(name = "celular",length = 12)
    private String celular;

    // Relaciones
    // Many To one
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idestado")
    @JsonManagedReference
    private Estado estado;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idpais")
    @JsonManagedReference
    private Pais pais;
    //One to One
    @OneToOne(mappedBy = "principalContact")
    @JsonIgnore
    private Contacto contacto;
    // one to many
    @OneToMany(mappedBy = "usuario", fetch = FetchType.LAZY)
    @JsonBackReference
    @JsonIgnore
    private List<Contacto> contactosDelUsuario;
    @OneToMany(mappedBy = "usuario",fetch = FetchType.LAZY)
    @JsonBackReference
    private List<Mensaje> mensajes;

}