export abstract class Item
{
    id: string|undefined;
    nombre: string|undefined;

    abstract getNombre():string;
    abstract getId():string;
}