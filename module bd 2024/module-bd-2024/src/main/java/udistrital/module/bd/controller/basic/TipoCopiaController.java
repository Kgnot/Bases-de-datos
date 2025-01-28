package udistrital.module.bd.controller.basic;


import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import udistrital.module.bd.entities.TipoCopia;
import udistrital.module.bd.service.tipoCopia.TipoCopiaService;

import java.util.List;

@RestController
@RequestMapping("/tipo_copia")
@RequiredArgsConstructor
public class TipoCopiaController {

    private final TipoCopiaService service;


    @GetMapping
    public List<TipoCopia> findAll(){
        return service.findAll();
    }


}
