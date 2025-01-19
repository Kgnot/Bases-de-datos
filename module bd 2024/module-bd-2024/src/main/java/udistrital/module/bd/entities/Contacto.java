package udistrital.module.bd.entities;


import java.util.List;

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
@Table(name = "Contacto")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Contacto {

    @Id
    @Column(name = "conseccontacto")
    private int consecContacto;
    @Column(name = "nombrecontacto", length = 30)
    private String nombreContacto;
    @Column(name = "correocontacto", length = 30)
    private String correoContacto;

    //Aqui irian las relaciones
    //Many to one: 
    @ManyToOne
    @JoinColumn(name = "usuario")
    private Usuario usuario;

    //One to one y one
    @OneToOne
    @JoinColumn(name = "usu_usuario")
    private Usuario principalContact;

    // one to many
    @OneToMany(mappedBy = "contacto")
    private List<Destinatario> destinatarios;


}
