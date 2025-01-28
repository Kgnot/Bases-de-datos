package udistrital.module.bd.controller.basic;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import udistrital.module.bd.entities.Pais;
import udistrital.module.bd.service.pais.PaisService;

@RestController
@RequestMapping("/pais")
@RequiredArgsConstructor
public class PaisController {

    private final PaisService service;


    @GetMapping
    public List<Pais> getAll(){
        return service.findAll();
    }
    
}
