package udistrital.module.bd.entities;

import java.sql.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
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
    @ManyToOne
    @JoinColumn(name = "idestado")
    @JsonManagedReference
    private Estado estado;
    @ManyToOne
    @JoinColumn(name = "idpais")
    @JsonManagedReference
    private Pais pais;
    //One to One
    @OneToOne
    @JoinColumn(name = "conseccontacto",referencedColumnName = "consecContacto")
    private Contacto contacto;
    // one to many
    @OneToMany(mappedBy = "usuario")
    private List<Contacto> contactosDelUsuario;
    @OneToMany(mappedBy = "usuario")
    private List<Mensaje> mensajes;

}