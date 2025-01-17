package udistrital.module.bd.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "Destinatario")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Destinatario {
    
    @Id
    @Column(name = "consecdestinatario")
    private int consecDestinatario;

    // Aquí las relaciones

}
