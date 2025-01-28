package udistrital.module.bd.controller.basic;


import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import udistrital.module.bd.entities.TipoArchivo;
import udistrital.module.bd.service.tipoArchivo.TipoArchivoService;

import java.util.List;

@RestController
@RequestMapping("/tipo_archivo")
@RequiredArgsConstructor
public class TipoArchivoController {

    private final TipoArchivoService service;


    @GetMapping
    public List<TipoArchivo> getAll(){
        return service.findAll();
    }

}
