import { Injectable } from '@nestjs/common';
import { Usuario } from './entities/Usuario.entity';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';

@Injectable()
export class LoginService {
  constructor(
    @InjectRepository(Usuario)
    private readonly usuarioRepository: Repository<Usuario>,
  ) {}

  async createUser(newUsuario: Usuario): Promise<Usuario> {
    return await this.usuarioRepository.save(newUsuario);
  }

  async findUsers(): Promise<Usuario[]> {
    return await this.usuarioRepository.find();
  }

  async findOneUser(id: string): Promise<Usuario> {
    const user = await this.usuarioRepository.findOne({
      where: { idUsuario: +id },
    });
    if (!user) {
      throw new Error(`User with id ${id} not found`);
    }
    return user;
  }

  async update(id: string, updateUser: Usuario): Promise<Usuario> {
    await this.findOneUser(id);

    await this.usuarioRepository.update(id, updateUser);
    return await this.findOneUser(id);
  }

  async remove(id: string) {
    await this.usuarioRepository.delete(id);
    return 'User deleted';
  }
}
