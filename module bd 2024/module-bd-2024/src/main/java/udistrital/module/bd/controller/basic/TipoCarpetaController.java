package udistrital.module.bd.controller.basic;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import udistrital.module.bd.entities.TipoCarpeta;
import udistrital.module.bd.service.tipoCarpeta.TipoCarpetaService;

import java.util.List;

@RestController
@RequestMapping("/tipo_carpeta")
@RequiredArgsConstructor
public class TipoCarpetaController {

    private final TipoCarpetaService service;


    @GetMapping
    public List<TipoCarpeta> findAll(){
        return service.findAll();
    }


}
