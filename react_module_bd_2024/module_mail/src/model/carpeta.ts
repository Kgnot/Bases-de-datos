import {Item} from "./item.ts";

export class Carpeta
{
    idTipoCarpeta:string;
    descTipoCarpeta:string;

    constructor(idTipoCarpeta:string,descTipoCarpeta:string)
    {
        this.idTipoCarpeta = idTipoCarpeta;
        this.descTipoCarpeta = descTipoCarpeta;
    }


}


export class CarpetaAdapter extends Item
{
    carpeta:Carpeta;

    constructor(carpeta:Carpeta) {
        super();
        this.carpeta = carpeta;
    }

    getId(): string {
        return this.carpeta.idTipoCarpeta;
    }

    getNombre(): string {
        return this.carpeta.descTipoCarpeta;
    }

}