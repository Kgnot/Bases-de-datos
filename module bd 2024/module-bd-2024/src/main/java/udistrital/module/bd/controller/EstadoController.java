package udistrital.module.bd.controller;


import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import udistrital.module.bd.entities.Estado;
import udistrital.module.bd.service.estado.EstadoService;

import java.util.List;

@RestController
@RequestMapping("/estado")
@RequiredArgsConstructor
public class EstadoController {

    private final EstadoService service;

    @GetMapping
    public List<Estado> getAll() {
        return service.findAll();
    }


}
