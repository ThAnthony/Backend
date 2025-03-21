import {
  Controller,
  Get,
  Post,
  Body,
  Param,
  Delete,
  Put,
} from '@nestjs/common';
import { LoginService } from './login.service';
import { Usuario } from './entities/Usuario.entity';

@Controller('User')
export class LoginController {
  constructor(private readonly loginService: LoginService) {}

  @Post('login')
  async login(
    @Body()
    loginDto: {
      username: string;
      password: string;
    },
  ): Promise<{ user?: Usuario; isLogin: boolean }> {
    const rpta = await this.loginService.login(
      loginDto.username,
      loginDto.password,
    );
    console.log('Controller:(user)', rpta.user);
    console.log('Controller(message)', rpta.isLogin);
    return rpta;
  }

  @Post()
  async create(
    @Body()
    NewUsuario: Usuario,
  ) {
    return await this.loginService.createUser(NewUsuario);
  }

  @Get()
  async findAll() {
    return await this.loginService.findUsers();
  }

  @Get(':idUsuario')
  async findOne(
    @Param('idUsuario')
    id: string,
  ) {
    return await this.loginService.findOneUser(id);
  }

  @Put(':idUsuario')
  update(
    @Param('idUsuario')
    id: string,
    @Body() updateLoginDto: Usuario,
  ) {
    return this.loginService.update(id, updateLoginDto);
  }

  @Delete(':idUsuario')
  remove(
    @Param('idUsuario')
    id: string,
  ) {
    return this.loginService.remove(id);
  }
}
