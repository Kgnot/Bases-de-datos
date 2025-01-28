import {Item} from "./item.ts";

export class Categoria
{
    idCategoria:string;
    descCategoria:string;

    constructor(idCategoria:string,descCategoria:string)
    {
        this.idCategoria = idCategoria;
        this.descCategoria = descCategoria;
    }


}


export class CategoriaAdapter extends Item
{
    carpeta:Categoria;

    constructor(carpeta:Categoria) {
        super();
        this.carpeta = carpeta;
    }

    getId(): string {
        return this.carpeta.idCategoria;
    }

    getNombre(): string {
        return this.carpeta.descCategoria;
    }

}