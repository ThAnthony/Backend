import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Product } from './entities/product.entity';

@Injectable()
export class ProductsService {
  constructor(
    @InjectRepository(Product)
    private readonly productRepository: Repository<Product>,
  ) {}

  // create(createProductDto: CreateProductDto) {
  //   return 'This action adds a new product';
  // }

  async CreateProduct(newProducto: Product): Promise<Product> {
    if (newProducto.isOferta) {
      newProducto.precioFinal =
        newProducto.precio - newProducto.precio * newProducto.porcentajeOferta;
    } else {
      newProducto.precioFinal = newProducto.precio;
    }
    return await this.productRepository.save(newProducto);
  }

  async findProducts(): Promise<Product[]> {
    return await this.productRepository.find({
      order: {
        idProducto: 'ASC',
      },
    });
  }

  async findOneProduct(id: string): Promise<Product> {
    const product = await this.productRepository.findOne({
      where: { idProducto: +id },
    });
    if (!product) {
      throw new Error(`Product with id ${id} not found`);
    }
    return product;
  }

  async updateProduct(id: string, UpdateProduct: Product): Promise<Product> {
    await this.findOneProduct(id);
    const Productfinal = { ...UpdateProduct, idProducto: +id };
    if (Productfinal.isOferta) {
      Productfinal.precioFinal =
        Productfinal.precio -
        Productfinal.precio * Productfinal.porcentajeOferta;
    } else {
      Productfinal.precioFinal = Productfinal.precio;
    }
    await this.productRepository.update(id, Productfinal);
    return this.findOneProduct(id);
  }
  async deleteProduct(id: string) {
    await this.productRepository.delete(id);
    return 'product deleted';
  }
}
