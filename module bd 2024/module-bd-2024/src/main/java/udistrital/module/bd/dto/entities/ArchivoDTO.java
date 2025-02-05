package udistrital.module.bd.dto.entities;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ArchivoDTO {
    private String nomArchivo;
    private String tipoArchivo;
}
