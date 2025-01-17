package udistrital.module.bd.entities;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonBackReference;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "Pais")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Pais {
    
    @Id
    @Column(name = "idpais", length = 5)
    private String idPais;
    @Column(name = "nompais", length = 30, nullable = false)
    private String nomPais;
    @Column(name = "dominio")
    private String dominio;

    // Aqui las diferentes relaciones.
    @OneToMany(mappedBy = "pais")
    @JsonBackReference
    private List<Usuario> usuarios;
    @OneToMany(mappedBy = "")
    @JsonBackReference
    private List<Destinatario> destinatarios;
}
